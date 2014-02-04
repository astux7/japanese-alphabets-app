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

  def self.random_image
     random_index = rand(All.count)
     All[random_index].thumbImage
  end


  All = [
   # Hiragana.new( 'Romaji', 'Hiragana', "Reading", "Meaning",'alfa.png', ""),
     #vowels
    Hiragana.new( 'あ', '[あ]お', "{a o}", "Blue",'a.png', "a"),
    Hiragana.new( 'い', '[い]す', "{i su}", "Chair",'i.png',"i"),
    Hiragana.new( 'う', '[う]で', "{u de}", "Arm",'u.png',"u"),
    Hiragana.new( 'え', '[え]いが', "{e i ga}", "Movie",'e.png',"e"),
    Hiragana.new( 'お', '[お]んな', "{o n na}", "Female",'o.png',"o"),
    #k-line
    Hiragana.new( 'か', '[か]いしゃ', "{ka i sha}", "Company",'ka.png',"ka"),
    Hiragana.new( 'き', '[き]ょう', "{ki ō}", "Today",'ki.png',"ki"),
    Hiragana.new( 'く', '[く]る', "{ku ru}", "Come",'ku.png',"ku"),
    Hiragana.new( 'け', '[け]むし', "{ke mu shi}", "Caterpillar",'ke.png',"ke"),
    Hiragana.new( 'こ', '[こ]ども', "ko do mo", "Child",'ko.png',"ko"),
    #s-line
    Hiragana.new( 'さ', '[さ]る', "{sa ru}", "Monkey",'sa.png',"sa"),
    Hiragana.new( 'し', '[し]お', "{shi o}", "Salt",'shi.png',"shi"),
    Hiragana.new( 'す', '[す]し', "{su shi}", "Sushi",'su.png',"su"),
    Hiragana.new( 'せ', '[せ]んせい', "{se n se i}", "Teacher",'se.png',"se"),
    Hiragana.new( 'そ', '[そ]こ', "{so ko}", "Bottom",'so.png',"so"),
    #t-line
    Hiragana.new( 'た', '[は]い', "{ha i}", "Yes",'ta.png',"ta"),
    Hiragana.new( 'ち', '[ち]', "{chi}", "Blood",'chi.png',"chi"),
    Hiragana.new( 'つ', '[つ]くる', "{tsu ku ru}", "Make",'tsu.png', "tsu"),
    Hiragana.new( 'て', '[て]', "{te}", "Hand",'te.png', "te"),
    Hiragana.new( 'と', '[と]けい', "{to ke i}", "Clock",'to.png',"to"),
    #n-line
    Hiragana.new( 'な', '[な]し', "{na shi}", "Pear",'na.png',"na"),
    Hiragana.new( 'に', '[に]ほん', "{ni ho n}", "Japan",'ni.png',"ni"),
    Hiragana.new( 'ぬ', '[ぬ]りえ', "{nu ri e}", "Coloring (book)",'nu.png',"nu"),
    Hiragana.new( 'ね', '[ね]こ', "{ne ko}", "Cat",'ne.png',"ne"),
    Hiragana.new( 'の', '[の]り', "{no ri}", "Glue",'no.png',"no"),
    #h-line
    Hiragana.new( 'は', '[は]', "{ha}", "Tooth",'ha.png',"ha"),
    Hiragana.new( 'ひ', '[ひ]と', "{hi to}", "Person",'hi.png',"hi"),
    Hiragana.new( 'ふ', '[ふ]ん', "{fu n}", "Minute",'fu.png',"fu"),
    Hiragana.new( 'へ', '[へ]び', "{he bi}", "Snake",'he.png',"he"),
    Hiragana.new( 'ほ', '[ほ]し', "{ho shi}", "Stars",'ho.png',"ho"),
    #m-line
    Hiragana.new( 'ま', '[ま]おう', "{ma o u}", "Devil",'ma.png',"ma"),
    Hiragana.new( 'み', '[み]る', "{mi ru}", "See",'mi.png',"mi"),
    Hiragana.new( 'む', '[む]し', "{mu shi}", "Insects",'mu.png',"mu"),
    Hiragana.new( 'め', '[め]', "{me}", "Eye",'me.png',"me"),
    Hiragana.new( 'も', '[む]ね', "{mu ne}", "Chest",'mo.png',"mo"),
    #y-line
    Hiragana.new( 'や', '[や]ま', "{ya ma}", "Mountain",'ya.png',"ya"),
    Hiragana.new( 'ゆ', '[ゆ]び', "{yu bi}", "Finger",'yu.png',"yu"),
    Hiragana.new( 'よ', '[よ]うふく', "{yo u hu ku}", "Outfit",'yo.png',"yo"),
    #r-line
    Hiragana.new( 'ら', '[ら]くだ', "{ra ku da}", "Camel",'ra.png',"ra"),
    Hiragana.new( 'り', '[り]す', "{ri su}", "Squirrel",'ri.png',"ri"),
    Hiragana.new( 'る', '[る]い', "{ru i}", "Base (baseball)",'ru.png',"ru"),
    Hiragana.new( 'れ', '[れ]い', "{re i}", "Zero",'re.png',"re"),
    Hiragana.new( 'ろ', '[ろ]く', "{ro ku}", "Six",'ro.png',"ro"),
    #w-line
    Hiragana.new( 'わ', '[わ]たし', "{wa ta shi}", "I",'wa.png',"wa"),
    Hiragana.new( 'を', '[を]', "{wo}", "follows the obj like 'did'",'wo.png',"wo"),
    #n-line
    Hiragana.new( 'ん', 'け[ん]', "{ke n}", "Item",'n.png',"n")
   ]
end