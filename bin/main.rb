require "task_oop_gem"
require "irb"

IRB.start

puts lib = Library.new

puts lib = lib.read

puts lib.most_popular_book

puts lib.who_often_takes

puts lib.people_ordered_one_of_three_books

book = Book.new(*["TitleNew", lib.authors[1]])

lib.add_item(book)

lib.save