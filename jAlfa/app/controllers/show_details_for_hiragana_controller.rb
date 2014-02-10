class ShowDetailsForHiraganaController < UIViewController
  # def loadView
  #   #self.view = UIWebView.alloc.init
  # end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(false, animated:true)
  end

  def showDetailsForHiragana(beer)
    #navigationItem.title = beer[0]
    label = UILabel.alloc.initWithFrame([[0, 70], [135, 40]])
    label.textColor = UIColor.alloc.initWithRed(0.8,green: 0.6,blue: 0.73, alpha:1.0) 
    label.font = UIFont.systemFontOfSize(30)
    label.backgroundColor =  UIColor.alloc.initWithRed(0.67,green: 0.53,blue: 0.6, alpha: 0.75)  
    label.text  = "  Scores:"
    view.addSubview label
    request = NSURLRequest.requestWithURL("http://www.google.com")
    view.loadRequest(request)
  end 

  end