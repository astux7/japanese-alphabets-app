class DrawLetterController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Practice', image:UIImage.imageNamed('draw.png'), tag:1)
      self.view.backgroundColor = UIColor.blueColor
     # self.view = PaintView.alloc.init
    end
    self
  end
  # def loadView
  #    self.view.backgroundColor = UIColor.redColor
  #    self.view.addSubview  = PaintView.alloc.init
  #  end
   def viewDidLoad
    super
    self.view = PaintView.alloc.init

  #   self.view.backgroundColor = UIColor.redColor

  #   self.view.addSubview PaintView.alloc.init
  end

  def motionEnded(motion, withEvent:event)
    self.view.eraseContent if motion == UIEventSubtypeMotionShake
  end
   # def loadView
   #   self.view = PaintView.alloc.init
   # end

  # def canBecomeFirstResponder
  #   true
  # end

  # def motionEnded(motion, withEvent:event)
  #   self.view.eraseContent if motion == UIEventSubtypeMotionShake
  # end
end