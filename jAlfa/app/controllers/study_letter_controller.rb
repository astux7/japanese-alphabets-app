
class StudyLetterController < UITableViewController 
  def init
    if super
      self.tabBarItem = UITabBarItem.alloc.initWithTitle('Study', image:UIImage.imageNamed('alfa.png'), tag:1)
    end
    self
  end

  def shouldAutorotate false end

  def viewDidLoad
    super
    
    self.tabBarController.navigationItem.title = "Hiragana App"
    search_bar = UISearchBar.alloc.initWithFrame([[0,0],[320,44]])
    search_bar.delegate = self
    view.addSubview(search_bar)
    view.tableHeaderView = search_bar
    @search_results = []
    view.backgroundColor = UIColor.alloc.initWithRed(0.94, green: 0.92, blue: 0.94, alpha:1.0)  

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
    @search_results = Hiragana::Groups.select{|hiragana| 
     hiragana if search_criteria?(hiragana, text)
    }
    view.reloadData
  end

  def search_criteria?(hiragana, text)
    return true if hiragana[1].strip.downcase.include? text.downcase
    return true if hiragana[2].strip.downcase.include? text.downcase
    false
 end

  #for the title to the top to work
  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end    

   def tableView(tableView, numberOfRowsInSection:section)
    @search_results.to_a.empty? ? Hiragana::Groups.size : @search_results.to_a.length 
  end

  CELLID = 'CellIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleNone 
      #cell.backgroundColor =UIColor.alloc.initWithRed(0.07,green: 0.07,blue: 0.07, alpha:1.0) 
     # UIColor.alloc.initWithRed(0.94, green: 0.92, blue: 0.94, alpha:1.0) 
      cell.font = UIFont.systemFontOfSize(27)
      cell
    end
    hiragana = @search_results.empty? ?  Hiragana::Groups[indexPath.row] : @search_results.to_a[indexPath.row]
    cell.textLabel.text = Hiragana.format_line(hiragana) 
    cell.detailTextLabel.text = Hiragana.format_line(hiragana, true)
    cell.textColor = UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 1.0)
    cell.detailTextLabel.textColor =  UIColor.alloc.initWithRed(0.39,green: 0.29,blue: 0.48, alpha: 1.0)  
    cell
  end

end
