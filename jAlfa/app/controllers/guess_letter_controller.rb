class GuessLetterController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Quiz', image:UIImage.imageNamed('questions.png'), tag:1)
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