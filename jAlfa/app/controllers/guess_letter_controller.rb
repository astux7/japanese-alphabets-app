class GuessLetterController < UIViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Quiz', image:UIImage.imageNamed('quiz.png'), tag:0)
     
    end
    self
  end
  #after init goes this
  def viewDidLoad   
    super
    self.new_game 
    self.init_views
    self.tabBarController.navigationItem.title = "title"
  end
  #for the title to the top to work!
  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:false)
  end    

 # initalize the game
  def new_game
    @quiz = Quiz.new
    @scores = @quiz.scores
    @buttons = []
  end
  
  def new_question
    self.clear
    self.init_views
  end 
  #clear views -> prepare for new question
  def clear
    view.subviews.each {|sv| sv.removeFromSuperview}
    @buttons = []
  end

 def init_views
    #view.title = "Editable Tableview"
    view.backgroundColor = UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) 
    # @alert = UIAlertView.alloc.initWithTitle("Quiz", 
    #     message: "Correct answer!", 
    #     delegate: nil,
    #     cancelButtonTitle: "Next question",
    #     otherButtonTitles: nil)  
    #creating question leafs
    questions = @quiz.generate_question
    #creating answer
    label_question = blossom_middle
    questions.each.with_index do |question, index|
      button_leaf = leaf_button(question,index)
      view.addSubview button_leaf
      #adding label of question
      if question[:correct]
      
        label_question.text = question[:label]
      end
    end
    view.addSubview label_question
    #results labels
    view.addSubview result_label
    view.addSubview result_scores_label
    view.addSubview quess_label
  end
  
  def leaf_button(question,index)

    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle question[:answer], forState: UIControlStateNormal
    button.frame = [[20, 150], [105, 105]] if index == 0
    button.frame = [[200, 150], [105, 105]] if index == 1
    button.frame = [[20, 300], [105, 105]] if index == 2
    button.frame = [[200, 300], [105, 105]] if index == 3
    button.font =  UIFont.systemFontOfSize(50)

    button.setTitleColor(UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) , forState:UIControlStateNormal) 
    #button.layer.cornerRadius = 50.0;
    #rounding the coners of leaf
    if index == 0 || index == 3
      mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                    byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomLeft,
                    cornerRadii:       CGSizeMake(40.0, 100.0))
    else
      mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                 byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomRight,
                 cornerRadii:       CGSizeMake(40.0, 100.0))
    end

    mask_layer = CAShapeLayer.layer
    mask_layer.frame = button.bounds
    mask_layer.path = mask_path.CGPath
    button.layer.mask = mask_layer

    button.tag = index #for send which was pressed
    button.backgroundColor = UIColor.alloc.initWithRed(0.90, green: 0.85, blue: 0.90, alpha:1.0) 
    button.addTarget(self,
      action: "check_answer:", forControlEvents: UIControlEventTouchUpInside) 
    @buttons.push button
    button
  end

  def quess_label
    @label_quess = UILabel.alloc.initWithFrame([[0, 400], [300, 100]])
    @label_quess.textAlignment = NSTextAlignmentCenter;
    @label_quess.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_quess.font = UIFont.systemFontOfSize(30)
    @label_quess.backgroundColor = UIColor.clearColor
    @label_quess.text  = ""
    @label_quess
  end

  def result_label
    label = UILabel.alloc.initWithFrame([[0, 0], [300, 100]])
    label.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    label.font = UIFont.systemFontOfSize(30)
    label.backgroundColor = UIColor.clearColor
    label.text  = "Scores: "
    label
  end

  def result_scores_label
    @scores_label = UILabel.alloc.initWithFrame([[200, 0], [100, 100]])
    @scores_label.textColor = UIColor.blueColor
    @scores_label.font = UIFont.systemFontOfSize(30)
    @scores_label.backgroundColor = UIColor.clearColor
    @scores_label.text  = @scores.to_s
    @scores_label
  end

  def blossom_middle
    #question label -> middle one
    label = UILabel.alloc.initWithFrame([[110, 225], [110, 110]])
    label.textColor =  UIColor.whiteColor 
    label.layer.cornerRadius = 50.0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    label.font = UIFont.systemFontOfSize(50)
    label.text = ""
    label
  end

  def check_answer(sender)
    button_index = sender.tag
    @quiz.game_over?(button_index) ? correct_answer : incorrect_answer(button_index)
    @scores_label.text = @scores.to_s
  end
  #correct answer -> next question
  def correct_answer
    @scores += 1
    new_question
    @label_quess.text = "That's correct!"
  end
  #quiz incorrect answer -> removes leaf
  def incorrect_answer(button_index)
    @scores -= 1
    @label_quess.text = "Oh incorrect!"
    @buttons[button_index].removeFromSuperview
  end

  # def done_with_b
  #   self.dismissViewControllerAnimated true, completion:nil
  # end

end