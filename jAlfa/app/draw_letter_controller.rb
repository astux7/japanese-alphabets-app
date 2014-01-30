class DrawLetterController < UIViewController
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Draw', image:UIImage.imageNamed('practice.png'), tag:1)
    end
    self
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