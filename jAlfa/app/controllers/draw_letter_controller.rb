class DrawLetterController < UIViewController
  def init
    @search_results = []
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Practice', image:UIImage.imageNamed('draw.png'), tag:2)
    end
    self
  end

  def shouldAutorotate 
    false 
  end

  #for the title on the top to work!
  def viewWillAppear(animated)
    self.tabBarController.navigationItem.title = "Practice"
    navigationController.setNavigationBarHidden(false, animated:true)
  end 

  def clear_button
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle "Clear", forState: UIControlStateNormal
    size = CGSizeMake(130, 50)

    
    button.frame = ipad? ? [[390,  UIScreen.mainScreen.bounds.size.height - 170], [340, 100]] : [[170,  UIScreen.mainScreen.bounds.size.height - 105], [130, 50]] 
    button.font = ipad? ? UIFont.systemFontOfSize(50) :  UIFont.systemFontOfSize(20)
   
    button.setTitleColor(UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) , forState:UIControlStateNormal) 

    mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomRight,
                cornerRadii:       CGSizeMake(40.0, 100.0))
    mask_layer = CAShapeLayer.layer
    mask_layer.frame = button.bounds
    mask_layer.path = mask_path.CGPath
    button.layer.mask = mask_layer
   # button.tag = index #for send which was pressed
    button.backgroundColor = UIColor.alloc.initWithRed(0.90, green: 0.85, blue: 0.90, alpha:1.0) 
    button.addTarget(self,
      action: "clear_drawing", forControlEvents: UIControlEventTouchUpInside) 
    button
  end

  def ipad?
    UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad
  end

  def next_letter_button
    @search_results.clear
    button = UIButton.buttonWithType UIButtonTypeRoundedRect
    button.setTitle "Next", forState: UIControlStateNormal
    
    button.frame = ipad? ? [[20,  UIScreen.mainScreen.bounds.size.height - 170], [340, 100]] : [[20,  UIScreen.mainScreen.bounds.size.height - 105], [130, 50]] 
    button.font = ipad? ? UIFont.systemFontOfSize(50) :  UIFont.systemFontOfSize(20)
    button.setTitleColor(UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) , forState:UIControlStateNormal) 

    mask_path = UIBezierPath.bezierPathWithRoundedRect(button.bounds,
                 byRoundingCorners: UIRectCornerTopRight | UIRectCornerBottomLeft,
                 cornerRadii:       CGSizeMake(40.0, 100.0))

    mask_layer = CAShapeLayer.layer
    mask_layer.frame = button.bounds
    mask_layer.path = mask_path.CGPath
    button.layer.mask = mask_layer
    
    button.backgroundColor = UIColor.alloc.initWithRed(0.90, green: 0.85, blue: 0.90, alpha:1.0) 
    button.addTarget(self,
      action: "next_random_letter", forControlEvents: UIControlEventTouchUpInside) 
    button
  end

  def  next_random_letter

   # search_bar.delegate = self

    
    reset


    search_bar = UISearchBar.alloc.initWithFrame([[0,64],[UIScreen.mainScreen.bounds.size.width,44]])
    search_bar.backgroundColor = UIColor.redColor
    search_bar.showsCancelButton = true
 #   search_bar.setBarTintColor = UIColor.clearColor
    search_bar.delegate = self



    view.backgroundColor = UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)

    @paintView = PaintView.alloc.initWithFrame(self.view.bounds)
    @paintView.backgroundColor = UIColor.clearColor
    #set bg img
    random_img = UIImage.imageNamed(Hiragana.random_image(@search_results))
    image_view = UIImageView.alloc.initWithImage(random_img)
    image_view.backgroundColor = UIColor.clearColor
    image_view_offset = (UIScreen.mainScreen.bounds.size.height / 480)
    image_view.setFrame(CGRectMake(0*image_view_offset,80*image_view_offset,310*image_view_offset-20,310*image_view_offset))
    #add subviews
    view.addSubview(image_view)
    view.addSubview(@paintView)
    view.addSubview(next_letter_button)
    view.addSubview(clear_button)
    view.addSubview(search_bar)


  end

  def reset
    view.subviews.each {|sv| sv.removeFromSuperview}
   # @search_results = []
  end

  def clear_drawing
    @paintView.eraseContent
  end

  def viewDidLoad
    super
   # self.
    # search_bar = UISearchBar.alloc.initWithFrame([[0,60],[320,44]])
    # search_bar.delegate = self

    # view.addSubview(search_bar)
 
    next_random_letter
    @search_results = []
   
  end

  def searchBarSearchButtonClicked(search_bar)
    @search_results.clear
    search_bar.resignFirstResponder
    search_for(search_bar.text)
    search_bar.text = search_bar.text
  end

  def searchBarCancelButtonClicked(searchBar)
    @search_results.clear
    searchBar.text = searchBar.text
    searchBar.resignFirstResponder
   # view.reloadData
  #  next_random_letter
    false
end
  def search_for(text)
    search_results_all = Hiragana::All.select{|hiragana| 
     hiragana  if hiragana.romaji.downcase.include? text.downcase
    }
    @search_results = search_results_all

   next_random_letter
  end


  def motionEnded(motion, withEvent:event)
    self.view.eraseContent if motion == UIEventSubtypeMotionShake
  end

  # def canBecomeFirstResponder
  #   true
  # end
end