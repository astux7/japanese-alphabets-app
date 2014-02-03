class Hiragana
  def initialize(letter = nil, hiragana_char = nil,reading = nil, translation = nil,thumbImage=nil,romaji = nil)
    @letter = letter
    @hiragana_char = hiragana_char
    @reading = reading
    @translation = translation
    @thumbImage = thumbImage
    @romaji = romaji
  end

  def letter; @letter; end
  def hiragana_char; @hiragana_char; end
  def reading; @reading; end
  def translation; @translation; end
  def thumbImage; @thumbImage; end
  def romaji; @romaji; end


  All = [
   # Hiragana.new( 'Romaji', 'Hiragana', "Reading", "Meaning",'alfa.png', ""),
     #vowels
    Hiragana.new( 'あ', '[あ]お', "{a o}", "Blue",'alfa.png', "a"),
    Hiragana.new( 'い', '[い]す', "{i su}", "Chair",'alfa.png',"i"),
    Hiragana.new( 'う', '[う]で', "{u de}", "Arm",'alfa.png',"u"),
    Hiragana.new( 'え', '[え]いが', "{e i ga}", "Movie",'alfa.png',"e"),
    Hiragana.new( 'お', '[お]んな', "{o n na}", "Female",'alfa.png',"o"),
    #k-line
    Hiragana.new( 'か', '[か]いしゃ', "{ka i sha}", "Company",'alfa.png',"ka"),
    Hiragana.new( 'き', '[き]ょう', "{ki ō}", "Today",'alfa.png',"ki"),
    Hiragana.new( 'く', '[く]る', "{ku ru}", "Come",'alfa.png',"ku"),
    Hiragana.new( 'け     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ke"),
    Hiragana.new( 'こ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ko"),
    #s-line
    Hiragana.new( 'さ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"sa"),
    Hiragana.new( 'し', '[し]お', "{shi o}", "Salt",'alfa.png',"shi"),
    Hiragana.new( 'す', '[す]し', "{su shi}", "Sushi",'alfa.png',"su"),
    Hiragana.new( 'せ', '[せ]んせい', "{se n se i}", "Teacher",'alfa.png',"se"),
    Hiragana.new( 'そ', '[そ]こ', "{so ko}", "Bottom",'alfa.png',"so"),
    #t-line
    Hiragana.new( 'た', '[は]い', "{ha i}", "Yes",'alfa.png',"ta"),
    Hiragana.new( 'ち     ', '[あ]お', "{a o}", "Blue",'alfa.png',"chi"),
    Hiragana.new( 'つ', '[つ]くる', "{tsu ku ru}", "Make",'alfa.png', "tsu"),
    Hiragana.new( 'て', '[て]', "{te}", "Hand",'alfa.png', "te"),
    Hiragana.new( 'と', '[と]けい', "{to ke i}", "Clock",'alfa.png',"to"),
    #n-line
    Hiragana.new( 'な     ', '[あ]お', "{a o}", "Blue",'alfa.png',"na"),
    Hiragana.new( 'に     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ni"),
    Hiragana.new( 'ぬ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"nu"),
    Hiragana.new( 'ね', '[ね]こ', "{ne ko}", "Cat",'alfa.png',"ne"),
    Hiragana.new( 'の     ', '[あ]お', "{a o}", "Blue",'alfa.png',"no"),
    #h-line
    Hiragana.new( 'は     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ha"),
    Hiragana.new( 'ひ', '[ひ]と', "{hi to}", "Person",'alfa.png',"hi"),
    Hiragana.new( 'ふ', '[ふ]ん', "{fu n}", "Minute",'alfa.png',"fu"),
    Hiragana.new( 'へ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"he"),
    Hiragana.new( 'ほ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ho"),
    #m-line
    Hiragana.new( 'ま     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ma"),
    Hiragana.new( 'み', '[み]る', "{mi ru}", "see",'alfa.png',"mi"),
    Hiragana.new( 'む     ', '[あ]お', "{a o}", "Blue",'alfa.png',"mu"),
    Hiragana.new( 'め     ', '[あ]お', "{a o}", "Blue",'alfa.png',"me"),
    Hiragana.new( 'も', '[む]ね', "{mu ne}", "Chest",'alfa.png',"mo"),
    #y-line
    Hiragana.new( 'や     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ya"),
    Hiragana.new( 'ゆ', '[ゆ]び', "{yu bi}", "Finger",'alfa.png',"yu"),
    Hiragana.new( 'よ     ', '[あ]お', "{a o}", "Blue",'alfa.png',"yo"),
    #r-line
    Hiragana.new( 'ら     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ra"),
    Hiragana.new( 'り     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ri"),
    Hiragana.new( 'る     ', '[あ]お', "{a o}", "Blue",'alfa.png',"ru"),
    Hiragana.new( 'れ', '[れ]い', "{re i}", "Zero",'alfa.png',"re"),
    Hiragana.new( 'ろ', '[ろ]く', "{ro ku}", "Six",'alfa.png',"ro"),
    #w-line
    Hiragana.new( 'わ', '[わ]たし', "{wa ta shi}", "I",'alfa.png',"wa"),
    Hiragana.new( 'を     ', '[あ]お', "{a o}", "Blue",'alfa.png',"w[o]"),
    #n-line
    Hiragana.new( 'ん     ', '[あ]お', "{a o}", "Blue",'alfa.png',"n")
   # Hiragana.new( 'Rochefort', 'http://en.wikipedia.org/wiki/Rochefort_Brewery'),
  #   Beer.new(51.284720, 4.656670, 'Westmalle', 'http://en.wikipedia.org/wiki/Westmalle_Brewery'),
  #   Beer.new(50.895942, 2.721262, 'Westvleteren', 'http://en.wikipedia.org/wiki/Westvleteren_Brewery'),
  #   Beer.new(51.298800, 5.488570, 'Achel', 'http://en.wikipedia.org/wiki/Achel_Brewery')
   ]
end