require_relative "word.rb"
require "yaml"

module Hangman
class Gamehangman
attr_accessor :word, :lives, :letters, :wrong_guesses, :correct_guesses, :charlen_help
    def initialize(word = Wordsdb.new.gameword)
        @word = word
        @letters = ('a'..'z').to_a
        @lives = 5
        @wrong_guesses = ""
        @correct_guesses = ""
        @charlen_help = ""
        end


    def deserialize(target_file)
        @word = target_file[0].word
        @letters = target_file[0].letters
        @lives = target_file[0].lives
        @wrong_guesses = target_file[0].wrong_guesses
        @correct_guesses = target_file[0].correct_guesses
        @charlen_help = target_file[0].charlen_help
        end



    def load_game
        saves
        puts "Enter the name of the game you want to load"
        game_to_be_loaded = gets.chomp
        game_loaded = YAML.load_file("../saves/#{game_to_be_loaded}.yml")
        deserialize(game_loaded)
        game_loaded
        charlen_help
        make_guess
    end


    def save_game
        puts 'Enter the name of your save:'
        savefile = gets.chomp
        Dir.mkdir('../saves') unless Dir.exist?('../saves')
        File.open("../saves/#{savefile}.yml", 'w') {|f| YAML.dump([]<< self,f)}
        saves
        exit
    end

    def saves

        listsaves = Dir['../saves/*'].map {|file| file.split('/')[-1].split('.')[0]}
        puts "You saved the following games: #{listsaves}"
    end

    def new_or_load
        puts "Welcome to hang man. Insert 1 if you want to play a new game, 2 if you want to load an existent game."
        status = gets.chomp
        if status == '1'
            game = Gamehangman.new
            game.play
        end
        if status == '2'
            load_game
        else
            puts "You didnt insert 1 or 2"
        end
    end

    
    def make_guess
        if @lives > 0

      

        if @charlen_help != word
            puts "To play, enter a letter. To save, 
            enter save, to exit, enter exit."
            guess =  gets.chomp
            correct_guess = word.include? guess

            save_game if guess == 'save'

            if guess == 'exit'
                puts "You quitted the game :("
                exit
            end

            if correct_guess
            puts "Correct"
            @correct_guesses.concat(guess)
            word.each_char.with_index do |char, index|
                if char == guess
                    @charlen_help[index] = guess
                end
            end
            p @charlen_help
            make_guess
        
            else
            @lives -= 1
            @wrong_guesses.concat(guess)
            puts "Wrong guess. You have #{@lives} lives left.
            Wrong letters already used: #{@wrong_guesses}"
            make_guess
            end

        else
            puts "Congratulations! You won! You saved the man!"
        end
            
        
        else
           puts "Game over! You killed him :(
               The right answer was: #{word}"
        end
    end
        



    def player_help
        word.size.times do
            @charlen_help += "_"
        end
        puts @charlen_help
    
    end

    
    def play
        puts "Game started. 
        The word has #{word.size} characters. Guess a letter."
        player_help
        make_guess

            
        end

end

end
