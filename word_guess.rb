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
		spaces = ["               ", "            ", "         ","      ","   ", ""] 
		dots = [5*" o ", 4*" o ", 3*" o ", 2*" o "," o ",""]
		move = ["", "   ", 2*"   ", 3*"   ",4*"   ",5*"   "]

		puts "==================================="
		puts "   #{move[wrong_count]}  .-.  #{spaces[wrong_count]}  .--.  "
		puts "   #{move[wrong_count]} | OO| #{spaces[wrong_count]} / _.-' "
		puts %! #{move[wrong_count]}   |   |  o  o  o  o  o    \\  '-. !
		puts "  #{{move[wrong_count]}}  '^^^' #{spaces[wrong_count]}  '--'  "
		puts "==================================="
	end

	

	private
	def guesses

end
