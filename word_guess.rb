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
	end

	def word_gen
		@word_list = ["ghost","pacman","purple", "bricks", "cool"]
		@secret_word = @word_list.sample
		@game_word = ("_"*@secret_word.length)

		@secret_word_array = @secret_word.split(//)
		@game_word_array = @game_word.split(//)
	end

	#asks user for a letter to guess in the word
	def user_input
		puts "Please pick a letter to guess the word."
		@letter = gets.chomp.downcase
	end

	def image

		@spaces = ["               ", "            ", "         ","      ","   ", ""]
		@dots = [" o "*5, " o "*4, " o "*3, " o "*2," o ",""]
		@move = ["", "   ", "   "*2, "   "*3,"   "*4,"   "*5]
		p1 = ".--.".colorize(:yellow)
		p2 = "/ _.-'".colorize(:yellow)
		p3 = %!\\  '-.!.colorize(:yellow)
		p4 = "'--'".colorize(:yellow)
		puts "===================================".colorize(:blue)
		puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{p1}  "
		puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{p2} "
		puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{p3} !
		puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{p4}  "
		puts "===================================".colorize(:blue)
		puts
		puts "Word: #{@game_word_array.join(" ")}"
		puts "Number of guesses left: #{5-@wrong_count}"
		puts "===================================".colorize(:blue)
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
		end
	end

	def game_over?
		guess
		if @wrong_count < 5
			if @game_word_array.include?("_")
				image
				user_input
				puts "wrong count <5 #{wrong_count}"
			else
				@spaces = ["               ", "            ", "         ","      ","   ", ""]
				@dots = [" o "*5, " o "*4, " o "*3, " o "*2," o ",""]
				@move = ["", "   ", "   "*2, "   "*3,"   "*4,"   "*5]
				p1 = ".--.".colorize(:yellow)
				p2 = "/ _.-'".colorize(:yellow)
				p3 = %!\\  '-.!.colorize(:yellow)
				p4 = "'--'".colorize(:yellow)

				puts "===================================".colorize(:green)
				puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{p1}  ".colorize(:green)
				puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{p2} ".colorize(:green)
				puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{p3} !.colorize(:green)
				puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{p4}  ".colorize(:green)
				puts "===================================".colorize(:green)
				puts
				puts "Word: #{@game_word_array.join(" ")}".colorize(:green)
				puts "Number of guesses left: #{5-@wrong_count}".colorize(:green)
				puts "===================================".colorize(:green)
				puts "CONGRATS!!! YOU WON!!!!!!".colorize(:green)
				exit
			end

		elsif @wrong_count == 5
			@spaces = ["               ", "            ", "         ","      ","   ", ""]
			@dots = [" o "*5, " o "*4, " o "*3, " o "*2," o ",""]
			@move = ["", "   ", "   "*2, "   "*3,"   "*4,"   "*5]
			p1 = ".--.".colorize(:yellow)
			p2 = "/ _.-'".colorize(:yellow)
			p3 = %!\\  '-.!.colorize(:yellow)
			p4 = "'--'".colorize(:yellow)
			puts "===================================".colorize(:red)
			puts "   #{@move[@wrong_count]}  .-.  #{@spaces[@wrong_count]}  #{p1}  ".colorize(:red)
			puts "   #{@move[@wrong_count]} | OO| #{@spaces[@wrong_count]} #{p2} ".colorize(:red)
			puts %! #{@move[@wrong_count]}   |   | #{@dots[@wrong_count].colorize(:green)} #{p3} !.colorize(:red)
			puts "  #{@move[@wrong_count]}  '^^^' #{@spaces[@wrong_count]}  #{p4}  ".colorize(:red)
			puts "===================================".colorize(:red)
			puts
			puts "Word: #{@game_word_array.join(" ")}".colorize(:red)
			puts "Number of guesses left: #{5-@wrong_count}".colorize(:red)
			puts "===================================".colorize(:red)
			puts "=( GAME OVER".colorize(:red)
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
