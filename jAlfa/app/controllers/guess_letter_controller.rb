class GuessLetterController < UIViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Challenge', image:UIImage.imageNamed('quiz.png'), tag:0)
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
    self.tabBarController.navigationItem.title = "Challenge"
    navigationController.setNavigationBarHidden(false, animated:true)
  end    

 # initalize the game
  def new_game
    @quiz = Quiz.new
    @scores = @quiz.scores
    @correct = @quiz.correct
    @incorrect = @quiz.incorrect
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
    view.addSubview results_label
    view.addSubview result_label_incorrect
     view.addSubview result_label_correct
     view.addSubview result_scores_label
    view.addSubview quess_label
  end
  
  def leaf_button(question,index)

    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle question[:answer], forState: UIControlStateNormal
    if  Helper.ipad? 
    offset =(UIScreen.mainScreen.bounds.size.height / 1024)
    button.frame = [[40*offset, 100*2*offset], [260, 260]] if index == 0
    button.frame = [[460*offset, 100*2*offset], [260, 260]] if index == 1
    button.frame = [[40*offset, 285*2*offset], [260, 260]] if index == 2
    button.frame = [[460*offset, 285*2*offset], [260, 260]] if index == 3
    button.font =  UIFont.systemFontOfSize(120)
    else
    offset =(UIScreen.mainScreen.bounds.size.height / 480)
    button.frame = [[20, 125*offset], [105, 105]] if index == 0
    button.frame = [[200, 125*offset], [105, 105]] if index == 1
    button.frame = [[20, 270*offset], [105, 105]] if index == 2
    button.frame = [[200, 270*offset], [105, 105]] if index == 3
    button.font =  UIFont.systemFontOfSize(45)
    end
    button.setTitleColor(UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) , forState:UIControlStateNormal) 
    #button.layer.cornerRadius = 50.0;
    #rounding the coners of leaf
    if index == 0 || index == 3
      mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                    byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomLeft,
                    cornerRadii:      Helper.ipad? ? CGSizeMake(80.0, 200.0) :  CGSizeMake(40.0, 100.0))
    else
      mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                 byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomRight,
                 cornerRadii:        Helper.ipad? ? CGSizeMake(80.0, 200.0) : CGSizeMake(40.0, 100.0))
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
    if Helper.ipad?
    @label_quess = UILabel.alloc.initWithFrame([[0, UIScreen.mainScreen.bounds.size.height - 122], [UIScreen.mainScreen.bounds.size.width, 60]])
    
   # @label_quess.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_quess.textColor = UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    @label_quess.font = UIFont.systemFontOfSize(50)

   else

    @label_quess = UILabel.alloc.initWithFrame([[0, UIScreen.mainScreen.bounds.size.height - 95], [UIScreen.mainScreen.bounds.size.width, 40]])
    
   # @label_quess.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_quess.textColor = UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    @label_quess.font = UIFont.systemFontOfSize(30)
  end
    #@label_quess.backgroundColor = UIColor.clearColor
    @label_quess.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    @label_quess.text  = ""
    @label_quess.textAlignment = NSTextAlignmentCenter;
    @label_quess
  end

  def result_label_correct
    @label_corect = UILabel.alloc.initWithFrame([[0, (Helper.ipad? ? 80 : 70)], [100, 40]])
    @label_corect.textColor = UIColor.greenColor #UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_corect.font = Helper.ipad? ? UIFont.systemFontOfSize(40) : UIFont.systemFontOfSize(20)
    #@label_corect.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    @label_corect.text  = " ✓: " + @correct.to_s  
     @label_corect.backgroundColor = UIColor.clearColor
    @label_corect
  end
  def result_label_incorrect
    @label_incorect = UILabel.alloc.initWithFrame([[UIScreen.mainScreen.bounds.size.width-105, (Helper.ipad? ? 80 : 70)], [100, 40]])
    @label_incorect.textColor = UIColor.redColor #UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @label_incorect.font = Helper.ipad? ? UIFont.systemFontOfSize(40) : UIFont.systemFontOfSize(20)
  #  @label_incorect.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    @label_incorect.text  = " ✗: " + @incorrect.to_s+" " 
    @label_incorect.textAlignment = NSTextAlignmentRight
     @label_incorect.backgroundColor = UIColor.clearColor
    @label_incorect
  end

  def result_scores_label
    @scores_label = UILabel.alloc.initWithFrame([[100,(Helper.ipad? ? 80 : 70)], [UIScreen.mainScreen.bounds.size.width-100*2, 40]])
    @scores_label.textColor =  UIColor.blueColor # UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    @scores_label.font = Helper.ipad? ? UIFont.systemFontOfSize(40) : UIFont.systemFontOfSize(20)
   # @scores_label.backgroundColor = UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)
    @scores_label.backgroundColor = UIColor.clearColor
    @scores_label.text  = " Σ= " + @scores.to_s
    @scores_label.textAlignment = NSTextAlignmentCenter
    @scores_label
  end

  def results_label
    if Helper.ipad?
      label = UILabel.alloc.initWithFrame([[0, 70], [UIScreen.mainScreen.bounds.size.width, 60]])
    else
     label = UILabel.alloc.initWithFrame([[0, 70], [UIScreen.mainScreen.bounds.size.width, 40]])
   end
    label.backgroundColor = UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)
    label
  end


  def blossom_middle
    #question label -> middle one
    
    if Helper.ipad?
          offset =(UIScreen.mainScreen.bounds.size.height / 1024)
      label = UILabel.alloc.initWithFrame([[270*offset, 400*offset], [220, 220]])
           label.font = UIFont.systemFontOfSize(120)
    else
      offset = (UIScreen.mainScreen.bounds.size.height / 480)
     label = UILabel.alloc.initWithFrame([[108, 195*offset], [110, 110]])
         label.font = UIFont.systemFontOfSize(50)
    end
    label.textColor =  UIColor.whiteColor 
    label.layer.cornerRadius = Helper.ipad? ? 100.0 : 50.0;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 

    label.text = ""
    label
  end

  def check_answer(sender)
    button_index = sender.tag
    @quiz.game_over?(button_index) ? correct_answer : incorrect_answer(button_index)
    @scores_label.text =  " Σ= " + @scores.to_s
    @scores_label.textAlignment = NSTextAlignmentCenter;


  end
  #correct answer -> next question
  def correct_answer
    new_question
    @label_quess.text = "That's correct!"
    @label_quess.textColor = UIColor.blueColor 
    return @scores = 0 if @scores > 10000 
    @scores += 1
    return @correct = 0 if @correct > 10000
    @correct +=1
    @label_corect.text  = " ✓: " + @correct.to_s 

  end
  #quiz incorrect answer -> removes leaf
  def incorrect_answer(button_index)
    @label_quess.text = "Guess once more!"
    @label_quess.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    @buttons[button_index].removeFromSuperview
    return @scores = 0 if @scores < -10000
    @scores -= 1
    return @incorrect = 0 if @incorrect > 10000
    @incorrect +=1
    @label_incorect.text  = " ✗: " + @incorrect.to_s+" " 
    @label_incorect.textAlignment = NSTextAlignmentRight
  end

end