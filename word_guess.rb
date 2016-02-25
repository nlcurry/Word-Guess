#word guess game

class word_guess
	def initialize
		@wrong_count = 0

	def word_gen
		word_list = ["ghost","pacman",""]

	#asks user for a letter to guess in the word
	def user_input 
		puts "Please pick a letter to guess the word."
		@letter = gets.chomp.downcase
	end

	def image
		puts "=================================="
		puts "     .-.  #{l[wrong_count]}  .--.  "
		puts "    | OO| #{l[wrong_count]} / _.-' "
		puts %!    |   |  o  o  o  o  o    \\  '-. !
		puts "    '^^^' #{l[wrong_count]}  '--'  "
		puts "=================================="
	end

l = ["               ", "            ", "         ","      ","   "] 
dots = [5*" o ", 4*" o ", 3*" o ", 2*" o "," o ",""]

	private
	def guesses

end
