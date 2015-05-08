require "date"
require_relative "book.rb"
require_relative "reader.rb"

class Order
  attr_accessor :book, :reader, :date

  def initialize(*params)
  	@book = params[0] if params[0]
  	@reader = params[1] if params[1]
  	@date = Date.now
  end
end