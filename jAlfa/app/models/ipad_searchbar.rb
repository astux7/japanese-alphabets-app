class IpadSearchBar < UISearchBar

  def layoutSubviews
    super
    subviews[0].subviews.each do |sv|
      if sv.isKindOfClass(UITextField)
        sv.frame = CGRectMake(20, 20, UIScreen.mainScreen.bounds.size.width - 100, 60)
        sv.font = UIFont.systemFontOfSize(20) 
      end
    end
  end
end
