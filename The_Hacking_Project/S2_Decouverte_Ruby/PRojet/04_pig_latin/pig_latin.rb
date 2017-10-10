#write your code here

def exist(l)
    list_of_vowels="aeiouyAEIOUY"
    list_of_vowels.each_char do |chr|
      if chr==l
         print" oui"
         true
       else
         false
       end
     end
end

def translate(sentence)
    letter=0

    sentence_words=sentence.split(" ")
# pour chaque mots
    sentence_words.each do |word_s|
# pour chaque lettre
         for letter in 0..(word_s.length-1)
            l=word_s[letter]
            w=word_s
# teste de consonne
             if l == "Q" || l == "q"
                if word_s[letter+1] == "u"
                  puts "oui444444444444"
                end
              puts "ouiiii"
              w.shift
              w.push(l)
             elsif exist(l)
                 print"ouiiii222é"
                 word_s
             else
                puts "non"
             end

             puts letter
         end

    end
     sentence_words
end

wordf=translate("MAis ou Qu'est donc qor ni car")

puts wordf[3][1..5]
puts ("MAis ou Qu'est donc or ni car")
puts ("MAis ou est donc or ni car".slice(1))





# shift
# push
