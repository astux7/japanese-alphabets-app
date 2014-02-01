class HiraganaListController < UITableViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('List', image:UIImage.imageNamed('alfa.png'), tag:1)
    end
    self
  end

  def viewDidLoad
    view.dataSource = view.delegate = self

  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end    

  def tableView(tableView, numberOfRowsInSection:section)
    Hiragana::All.size
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
    #  cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
   #   cell.selectionStyle = UITableViewCellSelectionStyleNone
      cell
    end

    bit = Hiragana::All[indexPath.row]
    cell.textLabel.text = bit.letter+" "+bit.hiragana_char+"  "+bit.reading+"  "+bit.translation
   # cell.imageView.image = UIImage.imageNamed(bit.thumbImage);
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    beer = Hiragana::All[indexPath.row]
    controller = UIApplication.sharedApplication.delegate.beer_details_controller
    navigationController.pushViewController(controller, animated:true)
   # controller.showDetailsForBeer(beer)
  end
end
