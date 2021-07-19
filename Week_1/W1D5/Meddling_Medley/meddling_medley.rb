

def silly_talk(str)
    vowel = "aeiou"

    str.split.map do |w| 
        if vowel.include?(w[-1].downcase)
            w + w[-1]
        else 
            word = ""
            w.each_char do |c| 
                word += c
                word += 'b' + c if "aeiou".include?(c.downcase) 
            end
            word
        end
    end.join(" ")

end
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    res = ""
    count = 0
    
    if str.length <= 1 then return str end
 
    curr = str[0]
    (0...str.length - 1).each { |i|
       count += 1
       
       if curr != str[i + 1]
          if count == 1 then num = "" 
          else num = count.to_s
          end
          
          res += curr + num 
          count = 0
          curr = str[i + 1]
       end
    }
    
    #Last char
    if count != 0 
       res += curr + (count + 1).to_s 
    else
       res += curr
    end
    
    return res
 end
