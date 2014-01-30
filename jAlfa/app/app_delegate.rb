class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [GuessLetterController.alloc.init, HiraganaListController.alloc.init,DrawLetterController.alloc.init,]
    tabbar.selectedIndex = 0
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible

    

    # @window.makeKeyAndVisible

    # @blue_view = UIView.alloc.initWithFrame(CGRectMake(50, 50, 100, 100))
    # @blue_view.backgroundColor = UIColor.blueColor
    # @window.addSubview(@blue_view)

    # alert = UIAlertView.new
    # alert.message = "Hi"
    # alert.show
    true
  end
end
