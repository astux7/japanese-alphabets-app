
class StudyLetterController < UITableViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Study', image:UIImage.imageNamed('alfa.png'), tag:1)

    end
    self
  end

  def viewDidLoad
    super
    self.tabBarController.navigationItem.title = "Hiragana App"
    search_bar = UISearchBar.alloc.initWithFrame([[0,0],[320,44]])
    search_bar.delegate = self
    search_bar.backgroundColor =   UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    view.addSubview(search_bar)
    view.tableHeaderView = search_bar
    @search_results = []
    view.backgroundColor =   UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    # @search_results =  Hiragana::All.select{|hiragana| 
    #  hiragana if (hiragana.romaji.strip.start_with? "aa")
    # }

    view.dataSource = view.delegate = self
  end

  def searchBarSearchButtonClicked(search_bar)
    @search_results.clear
    search_bar.resignFirstResponder
    navigationItem.title = "search results for '#{search_bar.text}'"
    search_for(search_bar.text)
    search_bar.text = ""
  end

  def search_for(text)
    @search_results = Hiragana::All.select{|hiragana| 
     hiragana if search_criteria?(hiragana, text)
    }
    view.reloadData
  end

  def search_criteria?(hiragana, text)
    return true if hiragana.romaji.strip.start_with? text
    return true if hiragana.letter.strip.start_with? text
    false
 end

  #for the title to the top to work
  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end    

   def tableView(tableView, numberOfRowsInSection:section)
   # Hiragana::All.size
    # UIView.alloc.init.tap do |view|
    #   view.backgroundColor = UIColor.blueColor
    # end
    @search_results.to_a.empty? ? Hiragana::All.size : @search_results.to_a.length 
    
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CELLID)
      cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton
      cell.selectionStyle = UITableViewCellSelectionStyleNone
      cell.backgroundColor = UIColor.alloc.initWithRed(0.90, green: 0.85, blue: 0.90, alpha:1.0) 
      cell.font = UIFont.systemFontOfSize(23)
      #.font = UIFont.boldSystemFontOfSize(17)
      cell
    end
  #  hirogana = Hiragana::All[indexPath.row]
    hiragana = @search_results.empty? ?  Hiragana::All[indexPath.row] : @search_results.to_a[indexPath.row]
    cell.textLabel.text = Hiragana.format_line(hiragana) #+" "+hiragana.romaji
   # cell.imageView.image = UIImage.imageNamed("sakura.png")
    cell
  end

  def tableView(tableView, accessoryButtonTappedForRowWithIndexPath:indexPath)
    #hiragana = Hiragana::All[indexPath.row]
    hiragana = @search_results.empty? ?  Hiragana::All[indexPath.row] : @search_results[indexPath.row] 
    controller = UIApplication.sharedApplication.delegate.beer_details_controller
    navigationController.pushViewController(controller, animated:true)
    controller.showDetailsForBeer(hiragana)
  end
end
