class HiraganaListController < UITableViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Study', image:UIImage.imageNamed('alfa.png'), tag:1)

    end
    self
  end

  def viewDidLoad
    super
    self.tabBarController.navigationItem.title = "Hiragana App"
    view.dataSource = view.delegate = self
  end

  #for the title to the top to work
  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end    

  def tableView(tableView, numberOfRowsInSection:section)
    Hiragana::All.size
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell.selectionStyle = UITableViewCellSelectionStyleNone
      cell
    end

    hirogana = Hiragana::All[indexPath.row]
    cell.textLabel.text = hirogana.letter+" "+hirogana.romaji
   # cell.imageView.image = UIImage.imageNamed(bit.thumbImage);
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    hiragana = Hiragana::All[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.beer_details_controller
    navigationController.pushViewController(controller, animated:true)
    controller.showDetailsForBeer(hiragana)
  end
end
