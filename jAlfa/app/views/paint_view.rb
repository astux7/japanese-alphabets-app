class PaintView < UIView
  def initWithFrame(rect)
    if super

      path = NSBundle.mainBundle.pathForResource('erase', ofType:'caf')
      url = NSURL.fileURLWithPath(path)
      error_ptr = Pointer.new(:id)
      @eraseSound = AVAudioPlayer.alloc.initWithContentsOfURL(url,
        error:error_ptr)
      unless @eraseSound
        raise "Can't open sound file: #{error_ptr[0].description}"
      end
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
    bp.miterLimit = 2.0
    bp.lineWidth = 12.0
    bp.flatness = 0.2
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

    # if @previousPoint and !@paths.empty?
    #   bp = @paths.last.first
    #   bp.addLineToPoint(point)
    #   # bp.stroke
    # end
    # @previousPoint = point
    setNeedsDisplay
  end

  def touchesEnded(touches, withEvent:event)
    @previousPoint = nil
  end

  def eraseContent
    @paths.clear
    @eraseSound.play
    setNeedsDisplay
  end

end
