#word guess game

#
require "colorize"

class Word_guess
	attr_accessor :wrong_count, :word_list, :secret_word, :game_word, :game_word_array

	def initialize
		@wrong_count = -1
		@word_list = nil
		@secret_word = nil
		@game_word = nil
		@game_word_array = nil
		@guessed_letters = []
	end

	def word_gen
		@word_list = {
		"celebrity" => ["sting", "beyonce", "madonna", "bono", "fabio", "nas", "prince", "adele","beck", "tupac"],
		"difficult" => ["ghost","pacman","joker", "bricks", "grandmother", "ninja", "fuzziest", "jazzy", "dwarves", "buffalo"],
		"animals" => ["monkey", "panda", "cat", "anteater", "girrafe", "elephant", "hotdog", "tiger"]
		}

		puts "Please pick a theme: celebrity, animals or difficult"
		theme_input = gets.chomp.downcase
		until theme_input == "celebrity" || theme_input == "difficult" || theme_input == "animals"
			puts "Wrong. Please pick one of the following: celebrity, animals or difficult"
			theme_input = gets.chomp.downcase
		end

		@secret_word = @word_list[theme_input].sample
		@game_word = ("_"*@secret_word.length)

		@secret_word_array = @secret_word.split(//)
		@game_word_array = @game_word.split(//)
	end

	#asks user for a letter to guess in the word
	def user_input
		puts "Please pick a letter to guess the word."
		@letter = gets.chomp.downcase
		@letters_array = [*?a..?z] #creates an array of the alphabet from a to z lowercase
		user_input_check
	end

	def user_input_check
		until @letters_array.include?(@letter)
			puts "Invalid Input".colorize(:red)
			user_input
		end

		if @guessed_letters.include?(@letter) || @game_word_array.include?(@letter)
			puts %!You've already used "#{@letter}"!.colorize(:red)
			user_input
		end
	end

	def image

		@spaces = ["               ", "            ", "         ","      ","   ", ""]
		@dots = [" o "*5, " o "*4, " o "*3, " o "*2," o ",""]
		@move = ["", "   ", "   "*2, "   "*3,"   "*4,"   "*5]
		@p1 = ".--.".colorize(:yellow)
		@p2 = %!/ _.-'!.colorize(:yellow)
		@p3 = %!\\  '-.!.colorize(:yellow)
		@p4 = "'--'".colorize(:yellow)
		puts "===================================".colorize(:blue)
		puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{@p1}  "
		puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{@p2} "
		puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{@p3} !
		puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{@p4}  "
		puts "===================================".colorize(:blue)
		puts
		puts "Word: #{@game_word_array.join(" ")}"
		puts "letters guessed: #{@guessed_letters.join(" ")}"
		puts "Number of guesses left: #{5-@wrong_count}"
		puts "===================================".colorize(:blue)
		puts
	end


	def guess

		if @secret_word_array.include?(@letter)
			@secret_word_array.each_index do |x|
				if @secret_word_array[x] == @letter
					@game_word_array[x] = @letter
				end
			end
		else
			@wrong_count += 1
			@guessed_letters.push(@letter)
		end
	end

	def game_over?
		guess
		if @wrong_count < 5
			if @game_word_array.include?("_")
				image
				user_input
			else

				puts "===================================".colorize(:green)
				puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{@p1}  ".colorize(:green)
				puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{@p2} ".colorize(:green)
				puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{@p3} !.colorize(:green)
				puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{@p4}  ".colorize(:green)
				puts "===================================".colorize(:green)
				puts
				puts "Word: #{@game_word_array.join(" ")}".colorize(:green)
				puts "letters guessed: #{@guessed_letters.join(" ")}".colorize(:green)
				puts "Number of guesses left: #{5-@wrong_count}".colorize(:green)
				puts "===================================".colorize(:green)
				puts "CONGRATS!!! YOU WON!!!!!!".colorize(:green)
				puts
				exit
			end

		elsif @wrong_count == 5

			puts "===================================".colorize(:red)
			puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{@p1}  ".colorize(:red)
			puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{@p2} ".colorize(:red)
			puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{@p3} !.colorize(:red)
			puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{@p4}  ".colorize(:red)
			puts "===================================".colorize(:red)
			puts
			puts "Word: #{@game_word_array.join(" ")}".colorize(:red)
				puts "letters guessed: #{@guessed_letters.join(" ")}".colorize(:red)
			puts "Word is #{@secret_word}"
			puts "Number of guesses left: #{5-@wrong_count}".colorize(:red)
			puts "===================================".colorize(:red)
			puts "=( GAME OVER".colorize(:red)
			puts
			exit
		end

	end

	def game_start
		puts "lets start the game!"
		word_gen
		until wrong_count == 5
			game_over?
		end
	end
end


game = Word_guess.new
puts game.game_start
