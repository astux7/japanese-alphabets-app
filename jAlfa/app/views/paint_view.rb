class PaintView < UIView
  def initWithFrame(rect)
    if super
      path = NSBundle.mainBundle.pathForResource('erase', ofType:'caf')
      url = NSURL.fileURLWithPath(path)
      error_ptr = Pointer.new(:id)
      @paths = []
    end
    self
  end

  def drawRect(rect)
    UIColor.clearColor.set
    UIBezierPath.bezierPathWithRect(rect).fill

    @paths.each do |path, color|
      color.set
      path.stroke
    end
  end

  def touchesBegan(touches, withEvent:event)
    bp = UIBezierPath.alloc.init
    bp.lineWidth =  UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad ? 18.0 :12.0
    color = UIColor.alloc.initWithRed(0.90, green: 0.85, blue: 0.90, alpha:1.0) 
    @paths << [bp, color]
    touch = event.touchesForView(self).anyObject
    point = touch.locationInView(self)
    bp.moveToPoint(point)
  end

  def touchesMoved(touches, withEvent:event)
    touch = event.touchesForView(self).anyObject
    point = touch.locationInView(self)
    bp = @paths.last.first
    bp.addLineToPoint(point)
    setNeedsDisplay
  end

  def touchesEnded(touches, withEvent:event)
    @previousPoint = nil
  end

  def eraseContent
    @paths.clear
    setNeedsDisplay
  end

end
