class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    tabbar = UITabBarController.alloc.init
    tabbar.viewControllers = [GuessLetterController.alloc.init, StudyLetterController.alloc.init,DrawLetterController.alloc.init,]
    #which view of tab to launch
    tabbar.selectedIndex = 1
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(tabbar)
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
end
