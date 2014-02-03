class DrawLetterController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Practice', image:UIImage.imageNamed('draw.png'), tag:2)
    end
    self
  end

  # def loadView
  #   super
  #   self.tabBarController.navigationItem.title = "Hiragana App"
  #  # self.view = PaintView.alloc.init
  #  self.view = PaintView.alloc.init

  # end
  #for the title on the top to work!
  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end 

 def viewDidLoad
    super
    self.tabBarController.navigationItem.title = "Hiragana App"
    paintView = PaintView.alloc.initWithFrame(self.view.bounds)
    
  
    xcode_image = UIImage.imageNamed("practice.png")
    @xcode_image_view1 = UIImageView.alloc.initWithImage(xcode_image)
    @xcode_image_view1.setFrame(CGRectMake(50,150,250,250))

    # self.addSubview(@xcode_image_view1)
     
    #view.addSubview(@xcode_image_view1)
    view.sendSubviewToBack(@xcode_image_view1)
    view.addSubview(@xcode_image_view1)
    paintView.backgroundColor = UIColor.clearColor
    view.addSubview(paintView)
     
  end

  def motionEnded(motion, withEvent:event)
    self.view.eraseContent if motion == UIEventSubtypeMotionShake
  end

  # def canBecomeFirstResponder
  #   true
  # end
end