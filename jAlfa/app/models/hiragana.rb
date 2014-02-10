class Hiragana
  def initialize(letter = nil, romaji = nil, thumbImage = nil)
    @letter = letter
    @thumbImage = thumbImage
    @romaji = romaji
  end

  attr_accessor :letter, :thumbImage, :romaji

  def self.random_image
     random_index = rand(All.count)
     All[random_index].thumbImage
  end

  def self.format_line(group, title = false)
    return group[2] if title
    group[1]
  end
  
  All = [
   # Hiragana.new( 'Romaji', 'Hiragana', "Reading", "Meaning",'alfa.png', ""),
     #vowels
    Hiragana.new( 'あ', "a", 'a.png'), #'[あ]お', "{a o}", "Blue",
    Hiragana.new( 'い', "i", 'i.png'), #'[い]す', "{i su}", "Chair",
    Hiragana.new( 'う', "u", 'u.png'), #, '[う]で', "{u de}", "Arm"
    Hiragana.new( 'え', "e", 'e.png'), #, '[え]いが', "{e i ga}", "Movie",
    Hiragana.new( 'お', "o", 'o.png'), #'[お]んな', "{o n na}", "Female",
    #k-line
    Hiragana.new( 'か', "ka", 'ka.png'), #'[か]いしゃ', "{ka i sha}", "Company",'ka.png',"ka"),
    Hiragana.new( 'き', "ki", 'ki.png'), # '[き]ょう', "{ki ō}", "Today",'ki.png',"ki"),
    Hiragana.new( 'く', "ku", 'ku.png'), #'[く]る', "{ku ru}", "Come",'ku.png',"ku"),
    Hiragana.new( 'け', "ke", 'ke.png'), #'[け]むし', "{ke mu shi}", "Caterpillar",'ke.png',"ke"),
    Hiragana.new( 'こ', "ko", 'ko.png'), #'[こ]ども', "{ko do mo}", "Child",'ko.png',"ko"),
    #s-line
    Hiragana.new( 'さ', "sa", 'sa.png'), # '[さ]る', "{sa ru}", "Monkey",'sa.png',"sa"),
    Hiragana.new( 'し', "shi", 'shi.png'), #'[し]お', "{shi o}", "Salt",'shi.png',"shi"),
    Hiragana.new( 'す', "su", 'su.png'), #'[す]し', "{su shi}", "Sushi",'su.png',"su"),
    Hiragana.new( 'せ', "se", 'se.png'), #'[せ]んせい', "{se n se i}", "Teacher",'se.png',"se"),
    Hiragana.new( 'そ', "so", 'so.png'), #'[そ]こ', "{so ko}", "Bottom",'so.png',"so"),
    #t-line
    Hiragana.new( 'た',"ta", "ta.png"), #'[は]い', "{ha i}", "Yes",'ta.png',"ta"),
    Hiragana.new( 'ち', "chi", "chi.png"), # '[ち]', "{chi}", "Blood",'chi.png',"chi"),
    Hiragana.new( 'つ', "tsu", "tsu.png"), # '[つ]くる', "{tsu ku ru}", "Make",'tsu.png', "tsu"),
    Hiragana.new( 'て', "te", "te.png"),  #'[て]', "{te}", "Hand",'te.png', "te"),
    Hiragana.new( 'と', "to", "to.png"), #'[と]けい', "{to ke i}", "Clock",'to.png',"to"),
    #n-line
    Hiragana.new( 'な', "na", "na.png"), #'[な]し', "{na shi}", "Pear",'na.png',"na"),
    Hiragana.new( 'に', "ni", "ni.png"), #'[に]ほん', "{ni ho n}", "Japan",'ni.png',"ni"),
    Hiragana.new( 'ぬ', "nu", "nu.png"), #'[ぬ]りえ', "{nu ri e}", "Coloring (book)",'nu.png',"nu"),
    Hiragana.new( 'ね', "ne", "ne.png"), #'[ね]こ', "{ne ko}", "Cat",'ne.png',"ne"),
    Hiragana.new( 'の', "no", "no.png"), #'[の]り', "{no ri}", "Glue",'no.png',"no"),
    #h-line
    Hiragana.new( 'は', "ha", "ha.png"), # '[は]', "{ha}", "Tooth",'ha.png',"ha"),
    Hiragana.new( 'ひ', "hi", "hi.png"),#'[ひ]と', "{hi to}", "Person",'hi.png',"hi"),
    Hiragana.new( 'ふ', "fu", "fu.png"), # '[ふ]ん', "{fu n}", "Minute",'fu.png',"fu"),
    Hiragana.new( 'へ', "he", "he.png"), # '[へ]び', "{he bi}", "Snake",'he.png',"he"),
    Hiragana.new( 'ほ', "ho", "ho.png"), #'[ほ]し', "{ho shi}", "Stars",'ho.png',"ho"),
    #m-line
    Hiragana.new( 'ま', "ma", "ma.png"), #'[ま]おう', "{ma o u}", "Devil",'ma.png',"ma"),
    Hiragana.new( 'み', "mi" "mi.png"), #'[み]る', "{mi ru}", "See",'mi.png',"mi"),
    Hiragana.new( 'む', "mu", "mu.png"), # '[む]し', "{mu shi}", "Insects",'mu.png',"mu"),
    Hiragana.new( 'め', "me", "me.png"), #'[め]', "{me}", "Eye",'me.png',"me"),
    Hiragana.new( 'も', "mu", "mu.png"), #'[む]ね', "{mu ne}", "Chest",'mo.png',"mo"),
    #y-line
    Hiragana.new( 'や', "ya", "ya.png"), # '[や]ま', "{ya ma}", "Mountain",'ya.png',"ya"),
    Hiragana.new( 'ゆ', "yu", "yu.png"), #'[ゆ]び', "{yu bi}", "Finger",'yu.png',"yu"),
    Hiragana.new( 'よ', "yo", "yo.png"), #'[よ]うふく', "{yo u hu ku}", "Outfit",'yo.png',"yo"),
    #r-line
    Hiragana.new( 'ら', "ra", "ra.png"), #'[ら]くだ', "{ra ku da}", "Camel",'ra.png',"ra"),
    Hiragana.new( 'り', "ri", "ri.png"), #'[り]す', "{ri su}", "Squirrel",'ri.png',"ri"),
    Hiragana.new( 'る', "ru", "ru.png"), #'[る]い', "{ru i}", "Base (baseball)",'ru.png',"ru"),
    Hiragana.new( 'れ', "re", "re.png"), #'[れ]い', "{re i}", "Zero",'re.png',"re"),
    Hiragana.new( 'ろ', "ro", "ro.png"), #'[ろ]く', "{ro ku}", "Six",'ro.png',"ro"),
    #w-line
    Hiragana.new( 'わ', "wa", "wa.png"), #'[わ]たし', "{wa ta shi}", "I",'wa.png',"wa"),
    Hiragana.new( 'を', "wo", "wo.pmg"), #'[を]', "{wo}", "follows the obj like 'did'",'wo.png',"wo"),
    #n-line
    Hiragana.new( 'ん', "n", "n.png") # 'け[ん]', "{ke n}", "Item",'n.png',"n")
   ]

   Groups = [
    ["Vowels", "  あ, い, う, え, お", "       A,          I,        U,        E,        O" ],
    ["K-line", "  か, き, く, け, こ","     Ka,        Ki,       Ku,      Ke,       Ko"],
    ["S-line", "  さ, し, す, せ, そ","     Sa,        Shi,      Su,      Se,       So"],
    ["T-line", "  は, ち, つ, て, と","     Ta,        Chi,      Tsu,     Te,       To"],
    ["N-line", "  な, に, ぬ, ね, の","     Na,        Ni,       Nu,     Ne,       No"],
    ["H-line", "  は, ひ, ふ, へ, ほ","     Ha,        Hi,       Hu,     He,       Ho"], 
    ["M-line", "  ま, み, む, め, も","     Ma,        Mi,      Mu,     Me,      Mo"],
    ["Y-line", "  や, ゆ, よ","     Ya,        Yu,       Yo"],
    ["R-line", "  ら, り, る, れ, ろ","     Ra,        Ri,       Ru,      Re,      Ro"],
    ["W-line", "  わ, を","     Wa,       Wo"],
    ["N-line", "  ん","     N"],
    ["G-line", "  が, ぎ, ぐ, げ, ご","     Ga,       Gi,      Gu,      Ge,       Go"],
    ["Z-line", "  ざ, じ, ず, ぜ, ぞ","     Za,        Ji,      Zu,      Ze,       Zo"],
    ["D-line", "  だ, ぢ, づ, で, ど","     Da,        Di,      Du,     De,       Do"],
    ["B-line", "  ば, び, ぶ, べ, ぼ","     Ba,        Bi,       Bu,     Be,       Bo"], 
    ["P-line", "  ぱ, ぴ, ぷ, ぺ, ぽ","     Pa,        Pi,       Pu,     Pe,       Po"],
    ["", "",""],
    ["", "",""]
   ]

   

end