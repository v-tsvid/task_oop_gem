require_relative './author.rb'

class Book
  attr_accessor :title, :author

  def initialize (*params)
  	@title  = params[0]
  	@author = params[1] if params[1]
  end

  def ==(other)
    @title == other.title && @author == other.author
  end
end