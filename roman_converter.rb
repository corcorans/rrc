# Class RomanNumeralCalculator, class to convert roman numerals to intergers,
# then perform simple arithmethic operation, then display the math performed
# and the original input along with the result.
# @author: Stephen Corcoran
class RomanNumeralCalculator
   ROMANS = ["M", "D", "C", "L", "X", "V", "I"]
   NUMERALS = [1000, 500, 100, 50, 10, 5, 1]

   # Converts an integer to a roman numeral 
   # @param: value, integer
   def to_roman(value)
      return "zero" if value == 0
      roman_numeral = value < 0 ? "-" : ""
      value = value.abs
    
      while value >= 1
         NUMERALS.each_with_index do |number, index|
            if value >= number
               roman_numeral += ROMANS[index]
               value -= number
               break
            end
         end
      end
      return roman_numeral
   end

   # Converts the roman numeral to its corresponding interger value.
   # @param: roman_numeral, string
   def to_numeric(roman_numeral)
      value = 0
      
      roman_numeral.each_char do |i|
         value += NUMERALS[ROMANS.index(i)].to_i
      end
      
      return value
   end
end

# Runs when the file is directly ran. Makes an instance of the class above
# to perform the simple operations and on two roman numeral numbers.
if __FILE__ == $0 
   calculate = RomanNumeralCalculator.new

   while readLine = gets do 
      input = readLine.to_s.chomp.split(" ")
      
      operator = input[1]
      roman_numeral_1 = 0
      roman_numeral_2 = 0

      roman_numeral_1 = calculate.to_numeric(input[0])
      roman_numeral_2 = calculate.to_numeric(input[2])
      result = roman_numeral_1.send(operator, roman_numeral_2)
     
      puts "#{roman_numeral_1} #{operator} #{roman_numeral_2} = #{result} = #{calculate.to_roman(result.to_i)}"
   end
end