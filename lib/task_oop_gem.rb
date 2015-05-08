require "task_oop_gem/version"
require "task_oop_gem/order"

require "psych"

module TaskOopGem
  def self.name
    "task_oop_gem"
  end

  class Library
  attr_accessor :books, :orders, :readers, :authors
  
  FILE_LIB = "task_oop_gem/library.dat"
  BOOKS_QUANT = 3 

  def initialize()
  end

  def add_item(item)
    { @authors => Author, @readers => Reader, @books => Book, @orders => Order }.each do |var, klass|
      if klass == item.class
        if var.include?(item)
          puts "This item is already in the library"
        else
          var << item
          puts var.inspect
        end  
      end
    end 
  end

  def save
    File.open(FILE_LIB, 'w') { |file| file.write(Psych.dump(self)) } 
  end

  def read
    begin
      Psych.load(File.open(FILE_LIB)) 
    rescue Errno::ENOENT => e
      puts "File \"#{FILE_LIB}\" not found"
    end
  end

  def rank_items(item)
    ranks = Hash.new
    eval("@#{item}s.map { |x| ranks[x] = (@orders.select { |order| order.#{item} == x }).count }")
    ranks.sort_by { |key, value| value }.reverse
  end

  def most_popular_book
    book = rank_items("book").first
    puts book.inspect
  end

  def who_often_takes
    who = rank_items("reader").first
    puts who.inspect
  end

  def people_ordered_one_of_three_books
    books = Hash.new
    books = rank_items("book").take(BOOKS_QUANT)
    people = @orders.select { |order| books.map { |book| book[0] }.include?(order.book) }.count
    puts "#{people} people"
  end
end
end
