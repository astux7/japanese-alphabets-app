class GuessLetterController < UIViewController
  SQUARE_SIZE = 80
  COLORS = [UIColor.greenColor, UIColor.redColor, UIColor.whiteColor]
 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Quiz', image:UIImage.imageNamed('quiz.png'), tag:1)
    end
    self
  end



  def viewDidLoad   
    self.new_game 
    self.init_views
  end

  def new_game
    # initalize the game
    @quiz = Quiz.new
    @scores = @quiz.scores
    @buttons = []
  end

  def new_question
    self.clear
    self.init_views
  end 

  def clear
    view.subviews.each {|sv| sv.removeFromSuperview}
    @buttons = []
  end

 def init_views
  
    view.backgroundColor = UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) 
    @alert = UIAlertView.alloc.initWithTitle("Quiz", 
        message: "Correct answer!", 
        delegate: nil,
        cancelButtonTitle: "Next question",
        otherButtonTitles: nil)  
    #super
   #question
    label1 = UILabel.alloc.initWithFrame([[110, 225], [110, 110]])
        label1.textColor =  UIColor.whiteColor #UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) 
        label1.layer.cornerRadius = 50.0;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.backgroundColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
        label1.font = UIFont.systemFontOfSize(50)
        label1.text = ""

    #scores label:
    label = UILabel.alloc.initWithFrame([[0, 0], [300, 100]])
    label.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    label.font = UIFont.systemFontOfSize(30)
    label.backgroundColor = UIColor.clearColor
    label.text  = "Scores: "
    view.addSubview(label)
    #scores points label:
    @scores_label = UILabel.alloc.initWithFrame([[200, 0], [100, 100]])
    @scores_label.textColor = UIColor.blueColor
    @scores_label.font = UIFont.systemFontOfSize(30)
    @scores_label.backgroundColor = UIColor.clearColor
    @scores_label.text  = @scores.to_s
    view.addSubview(@scores_label)
    #creating question buttons
    questions = @quiz.generate_question
    
    questions.each.with_index{|question, index|
      button = UIButton.buttonWithType UIButtonTypeRoundedRect
      button.setTitle question[:answer], forState: UIControlStateNormal

      button.frame = [[20, 150], [105, 105]] if index == 0
      button.frame = [[200, 150], [105, 105]] if index == 1
      button.frame = [[20, 300], [105, 105]] if index == 2
      button.frame = [[200, 300], [105, 105]] if index == 3
      button.font =  UIFont.systemFontOfSize(50)
      button.setTitleColor(UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) , forState:UIControlStateNormal) 
      #button.layer.cornerRadius = 50.0;
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
      button.backgroundColor = UIColor.alloc.initWithRed(0.90,green: 0.85,blue: 0.90, alpha:1.0) 
      button.addTarget(self,
                action: "check_answer:",
                forControlEvents: UIControlEventTouchUpInside) 
      view.addSubview button
      @buttons.push button
      #adding label of question
      if question[:correct] == true
           # label for game information
        label1.text = question[:label]
       # label1.backgroundColor = UIColor.clearColor
       # label1.sizeToFit
        
      end
    }
    view.addSubview  label1
  end
#open_b
  def check_answer(sender)
    #view_b = MyViewB.alloc.init
    # self.delegate = self
     button_pressed = sender.tag

     # @scores +=1
     # @scores_label.text  = @scores.to_s

     if @quiz.game_over?(button_pressed)
      @scores  +=1
       
        @alert.show

      self.new_question
     else
      @scores  -=1
      @buttons[button_pressed].backgroundColor = UIColor.redColor
    end
     @scores_label.text = @scores.to_s
    #self.presentViewController view_b, animated:true, completion:nil
  end

  def done_with_b
    self.dismissViewControllerAnimated true, completion:nil
  end




#   def viewDidLoad   
#     self.init_views
#    # self.new_game 
#   #  self.board_changed
#   end
#   def init_views
#     view.backgroundColor = UIColor.yellowColor
    
#     # view for the board
#     @board_view = UIView.alloc.initWithFrame([[0, 0], [SQUARE_SIZE * 3, SQUARE_SIZE * 3]])
#     @board_view.center = view.center
    
#     # views for the square
#     @square_views = []

#     for i in 0..2
#       for j in 0..2
#         square_view = UIView.alloc.initWithFrame([[j * (SQUARE_SIZE + 2), i * (SQUARE_SIZE + 2)], [SQUARE_SIZE - 4, SQUARE_SIZE - 4]])
#         square_view.layer.cornerRadius = 25.0
#         #square_view.label = "a"
#         @square_views[3*i + j] = square_view

#         @board_view.addSubview(square_view)
#       end
#     end


    
#     # label for game information
#     @label = UILabel.alloc.initWithFrame([[0, 0], [0, 0]])
#     @label.textColor = UIColor.whiteColor
#     @label.font = UIFont.systemFontOfSize(30)
#     @label.backgroundColor = nil

#     # label for game information
#     @label1 = UILabel.alloc.initWithFrame([[40, 160], [0, 0]])
#     @label1.textColor = UIColor.blueColor
#     @label1.font = UIFont.systemFontOfSize(50)
#    #  @label1.layer.cornerRadius = 25.0
#     @label1.text = "あ"
#     @label1.backgroundColor = UIColor.clearColor
#         @label1.sizeToFit
#     #   @label1.center = [60, 50]
    
#     view.addSubview(@label)
#     view.addSubview(@board_view)
#     view.addSubview(@label1)
#   end
#   # def viewDidLoad
#   #   view.dataSource = view.delegate = self
#   # end

#   # def viewWillAppear(animated)
#   #   navigationController.setNavigationBarHidden(true, animated:true)
#   # end 

# def show_info(text)
#     @label.text = text
#     @label.sizeToFit
#     @label.center = [160, 50]
#   end
  
#   def new_game
#     # initalize the game
#     @board = Board.new
#     @current_player = 0
#   end  
  
#   def touchesEnded(touches, withEvent:event)
#     # check if we're touching a square
#     for i in 0..8
#       if event.touchesForView(@square_views[i])
#         if not @board.move(i, @current_player) then 
#           show_info("Illegal move!")
#           break
#         end
        
#         @current_player += 1
#         @current_player %= 2
#         break
#       end
#     end
    
#     # check if the game is over
#     if winner = @board.game_over?
#       @board.reset
#       if winner == -1
#         show_info("No one wins!")
#       elsif winner
#         show_info("Player #{winner + 1} wins!")
#       end
#     end
    
#     self.board_changed
#   end
  
#   # update the square views
#   def board_changed
#     for i in 0..8
#       @square_views[i].backgroundColor = COLORS[@board.grid[i]]
#     end
#   end

end