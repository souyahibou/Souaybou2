#write your code here


#               A REVOIR

def exist(l)
    list_of_vowels="aeiouyAEIOUY"
    list_of_vowels.each_char do |chr|
      if chr == l then
        return true;puts chr
      end
    end
    return false
end



def translate(sentence)
    letter=0
    sentence_new = []
    sentence_words=sentence.split(" ")
    puts sentence_words

# pour chaque mots
    sentence_words.each do |word_s|
# pour chaque lettre
         for letter in 0..(word_s.length-1)
            l=word_s[0]
            w=word_s
            bonus = 0
# teste de consonne
             if !exist(l) then
               w << "aay"
               sentence_new << w
               next 3
             end

             if l == "Q" || l == "q"
                if word_s[1] == "u"
                  bonus=1
                  l=word_s[0..1]
                end
                puts "ouiiii"
                puts "cest ici " + w + " " + w.slice!(0, 1 + bonus) + " " + (w << l)
                puts w
                puts " "
#c'est une consonne
             else
                 print"ouiiii222é"
                 word_s
#c'est une voyelle
             end

             puts "\n\n\n #{sentence_new}"
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
