class GuessLetterController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Quiz', image:UIImage.imageNamed('quiz.png'), tag:1)
      self.view.backgroundColor = UIColor.alloc.initWithRed(0.85,green: 0.15,blue: 0.85, alpha:1.0)
    end
    self
  end

  # def viewDidLoad
  #   view.dataSource = view.delegate = self
  # end

  # def viewWillAppear(animated)
  #   navigationController.setNavigationBarHidden(true, animated:true)
  # end 

end