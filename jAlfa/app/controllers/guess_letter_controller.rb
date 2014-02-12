class GuessLetterController < UIViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Test', image:UIImage.imageNamed('quiz.png'), tag:0)
    end
    self
  end

  def shouldAutorotate
   false 
  end

  #after init goes this
  def viewDidLoad   
    super

    self.new_game 
    self.init_views

  end
  #for the title to the top to work!
  def viewWillAppear(animated)
    self.tabBarController.navigationItem.title = "Test"
    navigationController.setNavigationBarHidden(false, animated:true)
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

    view.backgroundColor = UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) 
    questions = @quiz.generate_question
    #creating answer
    label_question = blossom_middle
    questions.each.with_index do |question, index|
      button_leaf = leaf_button(question,index)
      view.addSubview button_leaf
      #adding label of question
      label_question.text = question[:label]if question[:correct]

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
    offset =(UIScreen.mainScreen.bounds.size.height / 480)
    button.frame = [[20, 115*offset], [105, 105]] if index == 0
    button.frame = [[200, 115*offset], [105, 105]] if index == 1
    button.frame = [[20, 265*offset], [105, 105]] if index == 2
    button.frame = [[200, 265*offset], [105, 105]] if index == 3
    button.font =  UIFont.systemFontOfSize(45)

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
    @label_quess = UILabel.alloc.initWithFrame([[0, UIScreen.mainScreen.bounds.size.height - 105], [330, 40]])
    @label_quess.textAlignment = NSTextAlignmentCenter;
   # @label_quess.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_quess.textColor = UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    @label_quess.font = UIFont.systemFontOfSize(30)
    #@label_quess.backgroundColor = UIColor.clearColor
    @label_quess.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    @label_quess.text  = ""
    @label_quess
  end

  def result_label
    label = UILabel.alloc.initWithFrame([[0, 70], [135, 40]])
    label.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    label.font = UIFont.systemFontOfSize(30)
    label.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    label.text  = "  Scores:"
    label
  end

  def result_scores_label
    @scores_label = UILabel.alloc.initWithFrame([[135, 70], [250, 40]])
    @scores_label.textColor = UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    @scores_label.font = UIFont.systemFontOfSize(30)
    @scores_label.backgroundColor = UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)
    #@scores_label.backgroundColor = UIColor.clearColor
    @scores_label.text  = @scores.to_s
    @scores_label
  end

  def blossom_middle
    #question label -> middle one
    offset = (UIScreen.mainScreen.bounds.size.height / 480)
    label = UILabel.alloc.initWithFrame([[108, 190*offset], [110, 110]])
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
    new_question
    @label_quess.text = "That's correct!"
    return @scores = 0 if @scores > 1000000 
    @scores += 1

  end
  #quiz incorrect answer -> removes leaf
  def incorrect_answer(button_index)
    @label_quess.text = "Guess once more!"
    @buttons[button_index].removeFromSuperview
    return @scores = 0 if @scores < -1000000
    @scores -= 1
  end

end