#!/usr/bin/env ruby
require './person'
require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :book_list, :people_list

  def initialize()
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def list_books()
    @book_list.each_with_index do |value, index|
      print index + 1, '). title: ', value.title, ' author: ', value.author, "\n"
    end
  end

  def list_people()
    @people_list.each_with_index do |value, index|
      if defined?(value.classroom)
        print index + 1, '). [Student] '
      else
        print index + 1, '). [Teacher] '
      end
      print ' age: ', value.age, ' name: ', value.name, ' ID: ', value.id, "\n"
    end
  end

  def list_rentals()
    print 'ID of person: '
    id = gets.chomp.to_i
    if !@people_list.find { |person| person.id == id }
      puts "No rental found with ID: #{id}"
    elsif @rental_list.empty?
      puts 'Please add some rentals'
    else
      @rental_list.each do |rental|
        if rental.person.id.to_i == id
          puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end

  def add_student(classroom, age, name, permission)
    student = Student.new(classroom, age, name, parent_permission: permission)
    @people_list.push(student)
    puts 'student created successfully!'
  end

  def add_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people_list.push(teacher)
    puts 'teacher created successfully!'
  end

  def add_book()
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @book_list.push(book)
    puts 'Book created successfully!'
  end

  def add_rental(date, book, person)
    rental = Rental.new(date, book, person)
    @rental_list.push(rental)
    puts 'Rental created successfully!'
  end

  def run
    puts 'Thanks for visiting...'
  end
end