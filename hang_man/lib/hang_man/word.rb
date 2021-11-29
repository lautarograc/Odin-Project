module Hangman
class Wordsdb
  attr_accessor :gameword
  def initialize
    @gameword = gameword
  end

  def words
    dictionary = File.open("../datafiles/5desk.txt", 'r', &:read)
    words = dictionary.split(/\r\n/)
  end
  
  def eligible_words
    eligible_words = words.delete_if { |x| x.length < 5 || x.length > 12}
  end

  def gameword
    eligible_words.sample.downcase
  end

  def begin
  puts "your word is #{@gameword}"
  end


end

end