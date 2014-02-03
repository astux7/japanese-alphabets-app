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
   #  #@images = %w{matz guido kay jmccolor}.map { |name| UIImage.imageNamed(name + '.jpg') }
    
   #  UIColor.colorWithPatternImage(UIImage.imageNamed("practice.png")).set

   #  # xcode_image = UIImage.imageNamed("practice.png")
   #  # @xcode_image_view1 = UIImageView.alloc.initWithImage(xcode_image)
   #  # @xcode_image_view1.setFrame(CGRectMake(50,150,250,250))

   #  # self.addSubview(@xcode_image_view1)
   #  # self.sendSubviewToBack(@xcode_image_view1)

    UIBezierPath.bezierPathWithRect(rect).fill
    @paths.each do |path, color|
      color.set
      path.stroke
    end
  end

  def touchesBegan(touches, withEvent:event)
    bp = UIBezierPath.alloc.init
    bp.lineWidth = 3.0
    color = UIColor.alloc.initWithRed(1.0,green: 1.0,blue: 1.0, alpha:1.0)
    @paths << [bp, color]
  end

  def touchesMoved(touches, withEvent:event)
    touch = event.touchesForView(self).anyObject
    point = touch.locationInView(self)
    if @previousPoint and !@paths.empty?
      bp = @paths.last.first
      bp.moveToPoint(@previousPoint)
      bp.addLineToPoint(point)
    end
    @previousPoint = point
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
