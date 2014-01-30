class HiraganaListController < UITableViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('List', image:UIImage.imageNamed('practice.png'), tag:1)
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