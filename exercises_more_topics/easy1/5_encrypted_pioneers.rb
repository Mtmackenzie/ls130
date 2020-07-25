# 5 Encrypted Pioneers
# The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called Rot13.
# input: string
# output: string
# rules: capitalize each word
# problem: downcase, break apart into array of chars, find char to the left 13 chars, return as string capitalized

def rot13(string)
  alphabet = ('a'..'z').to_a
  array = string.downcase.chars
  array.map.with_index do |letter, idx|
    if !alphabet.include?(letter)
      letter
    elsif alphabet.index(letter) < 12
      index = 25 - (12 - alphabet.index(letter))
      string[idx].downcase == string[idx] ? alphabet[index] : alphabet[index].upcase
    else
      letter = alphabet[alphabet.index(letter) - 13]
      string[idx].downcase == string[idx] ? letter : letter.upcase
    end
  end.join
end



p rot13("Nqn Ybirynpr")
p rot13("Tenpr Ubccre")
p rot13("Nqryr Tbyqfgvar")
p rot13("Nyna Ghevat")
p rot13("Puneyrf Onoontr")
p rot13("Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv")
p rot13("Wbua Ngnanfbss")
p rot13("Ybvf Unvog")
p rot13("Pynhqr Funaaba")
p rot13("Fgrir Wbof")
p rot13("Ovyy Tngrf")
p rot13("Gvz Orearef-Yrr")
p rot13("Fgrir Jbmavnx")
p rot13("Xbaenq Mhfr")
p rot13("Fve Nagbal Ubner")
p rot13("Zneiva Zvafxl")
p rot13("Lhxvuveb Zngfhzbgb")
p rot13("Unllvz Fybavzfxv")
p rot13("Tregehqr Oynapu")

# Write a program that deciphers and prints each of these names .