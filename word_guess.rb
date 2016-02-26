#word guess game

class Word_guess
	attr_accessor :wrong_count, :word_list, :secret_word, :game_word

	def initialize
		@wrong_count = 0
		@word_list = nil
		@secret_word = nil
		@game_word = nil
	end

	def word_gen
		word_list = ["ghost","pacman","purple", "bricks", "cool"]
		secret_word = word_list.sample
		game_word = ("_"*secret_word.length)
	end

	#asks user for a letter to guess in the word
	def user_input 
		puts "Please pick a letter to guess the word."
		@letter = gets.chomp.downcase
	end

	def image

		spaces = ["               ", "            ", "         ","      ","   ", ""] 
		dots = [" o "*5, " o "*4, " o "*3, " o "*2," o ",""]
		move = ["", "   ", "   "*2, "   "*3,"   "*4,"   "*5]

		puts "==================================="
		puts "   #{move[wrong_count]}  .-.  #{spaces[wrong_count]}  .--.  "
		puts "   #{move[wrong_count]} | OO| #{spaces[wrong_count]} / _.-' "
		puts %! #{move[wrong_count]}   |   | #{dots[wrong_count]} \\  '-. !
		puts "  #{move[wrong_count]}  '^^^' #{spaces[wrong_count]}  '--'  "
		puts "==================================="
		puts
		puts "Word: #{game_word}"
		puts "Number of guesses left: #{5-wrong_count}"
		puts "==================================="
	end


	def guess
		secret_word_array = secret_word.split(//)
		game_word_array = game_word.split(//)

		if secret_word_array.include?(@letter)
			secret_word_array.each do |x|
				if x == @letter
					game_word_array[secret_word_array[x].index] = @letter
				end
			end
		else
			wrong_count += 1

		end
	end

	def game_over?
		guess
		if wrong_count < 5
			if game_word_array.include?("_")
				image
				user_input
			else
				puts "CONGRATS!!! YOU WON!!!!!!"
			end

		elsif wrong_count >= 5
			puts "=( GAME OVER"
		end

	end

	def game_start
		puts "lets start the game!"
		word_gen
		game_over?
	end
end


game = Word_guess.new
puts game.game_start

