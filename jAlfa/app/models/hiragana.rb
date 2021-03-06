class Hiragana
  def initialize(letter = nil, romaji = nil, thumbImage = nil)
    @letter = letter
    @thumbImage = thumbImage
    @romaji = romaji
  end

  attr_accessor :letter, :thumbImage, :romaji

  def self.random_image(letter = [])
         return "none.png" if !letter.empty? && letter.first == "none"
     return letter.first.thumbImage if !letter.empty? && !letter.first.thumbImage.nil?
     random_index = rand(All.count)
     All[random_index].thumbImage
  end

  def self.format_line(group, title = false)
    return group[2] if title
    group[1]
  end
  
  All = [
    #vowels
    Hiragana.new( 'あ', "a", 'a.png'),
    Hiragana.new( 'い', "i", 'i.png'), 
    Hiragana.new( 'う', "u", 'u.png'), 
    Hiragana.new( 'え', "e", 'e.png'), 
    Hiragana.new( 'お', "o", 'o.png'), 
    #k-line
    Hiragana.new( 'か', "ka", 'ka.png'), 
    Hiragana.new( 'き', "ki", 'ki.png'), 
    Hiragana.new( 'く', "ku", 'ku.png'), 
    Hiragana.new( 'け', "ke", 'ke.png'), 
    Hiragana.new( 'こ', "ko", 'ko.png'), 
    #s-line
    Hiragana.new( 'さ', "sa", 'sa.png'), 
    Hiragana.new( 'し', "shi", 'shi.png'), 
    Hiragana.new( 'す', "su", 'su.png'), 
    Hiragana.new( 'せ', "se", 'se.png'), 
    Hiragana.new( 'そ', "so", 'so.png'), 
    #t-line
    Hiragana.new( 'た',"ta", "ta.png"),
    Hiragana.new( 'ち', "chi", "chi.png"), 
    Hiragana.new( 'つ', "tsu", "tsu.png"), 
    Hiragana.new( 'て', "te", "te.png"),  
    Hiragana.new( 'と', "to", "to.png"), 
    #n-line
    Hiragana.new( 'な', "na", "na.png"), 
    Hiragana.new( 'に', "ni", "ni.png"), 
    Hiragana.new( 'ぬ', "nu", "nu.png"),
    Hiragana.new( 'ね', "ne", "ne.png"), 
    Hiragana.new( 'の', "no", "no.png"), 
    #h-line
    Hiragana.new( 'は', "ha", "ha.png"), 
    Hiragana.new( 'ひ', "hi", "hi.png"),
    Hiragana.new( 'ふ', "fu", "fu.png"), 
    Hiragana.new( 'へ', "he", "he.png"),
    Hiragana.new( 'ほ', "ho", "ho.png"), 
    #m-line
    Hiragana.new( 'ま', "ma", "ma.png"), 
    Hiragana.new( 'み', "mi", "mi.png"), 
    Hiragana.new( 'む', "mu", "mu.png"), 
    Hiragana.new( 'め', "me", "me.png"), 
    Hiragana.new( 'も', "mo", "mo.png"), 
    #y-line
    Hiragana.new( 'や', "ya", "ya.png"),
    Hiragana.new( 'ゆ', "yu", "yu.png"), 
    Hiragana.new( 'よ', "yo", "yo.png"),
    #r-line
    Hiragana.new( 'ら', "ra", "ra.png"), 
    Hiragana.new( 'り', "ri", "ri.png"), 
    Hiragana.new( 'る', "ru", "ru.png"),
    Hiragana.new( 'れ', "re", "re.png"), 
    Hiragana.new( 'ろ', "ro", "ro.png"), 
    #w-line
    Hiragana.new( 'わ', "wa", "wa.png"),
    Hiragana.new( 'を', "wo", "wo.png"), 
    #n-line
    Hiragana.new( 'ん', "n", "n.png"),
    #g-line
    Hiragana.new( 'が', "ga", "ga.png"),
    Hiragana.new( 'ぎ', "gi", "gi.png"),
    Hiragana.new( 'ぐ', "gu", "gu.png"),
    Hiragana.new( 'げ', "ge", "ge.png"),
    Hiragana.new( 'ご', "go", "go.png"),
    #z-line
    Hiragana.new( 'ざ', "za", "za.png"),
    Hiragana.new( 'じ', "ji", "zi.png"),
    Hiragana.new( 'ず', "zu", "zu.png"),
    Hiragana.new( 'ぜ', "ze", "ze.png"),
    Hiragana.new( 'ぞ', "zo", "zo.png"),
    #d-line
    Hiragana.new( 'だ', "da", "da.png"),
  #  Hiragana.new( 'ぢ', "ji", "di.png"),
 #   Hiragana.new( 'づ', "zu", "du.png"),
    Hiragana.new( 'で', "de", "de.png"),
    Hiragana.new( 'ど', "do", "do.png"),
    #b-line
    Hiragana.new( 'ば', "ba", "ba.png"),
    Hiragana.new( 'び', "bi", "bi.png"),
    Hiragana.new( 'ぶ', "bu", "bu.png"),
    Hiragana.new( 'べ', "be", "be.png"),
    Hiragana.new( 'ぼ', "bo", "bo.png"),
    #p-line
    Hiragana.new( 'ぱ', "pa", "pa.png"),
    Hiragana.new( 'ぴ', "pi", "pi.png"),
    Hiragana.new( 'ぷ', "pu", "pu.png"),
    Hiragana.new( 'ぺ', "pe", "pe.png"),
    Hiragana.new( 'ぽ', "po", "po.png")
   ]

   Groups = [
    ["Vowels", "    あ,  い,  う,  え,  お","           A,          I,          U,           E,           O" ],
    ["K-line", "    か,  き,  く,  け,  こ","         Ka,         Ki,         Ku,        Ke,         Ko"],
    ["S-line", "    さ,  し,  す,  せ,  そ","         Sa,         Shi,        Su,        Se,         So"],
    ["T-line", "    た,  ち,  つ,  て,  と","         Ta,         Chi,        Tsu,       Te,         To"],
    ["N-line", "    な,  に,  ぬ,  ね,  の","         Na,         Ni,         Nu,        Ne,         No"],
    ["H-line", "    は,  ひ,  ふ,  へ,  ほ","         Ha,         Hi,         Fu,        He,         Ho"], 
    ["M-line", "    ま,  み,  む,  め,  も","         Ma,         Mi,         Mu,        Me,        Mo"],
    ["Y-line", "    や,  ゆ,  よ"         ,"         Ya,         Yu,         Yo"],
    ["R-line", "    ら,  り,  る,  れ,  ろ","         Ra,         Ri,         Ru,        Re,         Ro"],
    ["W-line", "    わ,  を"              ,"         Wa,         Wo"],
    ["N-line", "    ん"                   ,"         N"],
    ["G-line", "    が,  ぎ,  ぐ,  げ,  ご","         Ga,         Gi,         Gu,        Ge,         Go"],
    ["Z-line", "    ざ,  じ,  ず,  ぜ,  ぞ","         Za,         Ji,         Zu,        Ze,         Zo"],
    ["D-line", "    だ,  で,  ど"         ,"         Da,         De,         Do"],
    #   ["D-line", "    だ,  ぢ,  づ,  で,  ど","         Da,         Ji,         Zu,        De,         Do"],
    ["B-line", "    ば,  び,  ぶ,  べ,  ぼ","         Ba,         Bi,         Bu,        Be,         Bo"], 
    ["P-line", "    ぱ,  ぴ,  ぷ,  ぺ,  ぽ","         Pa,         Pi,         Pu,        Pe,         Po"],
    ["", "",""]
   ]

   

end