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

def display_options()
  puts "\nPlease choose an action by entering a number"
  puts "1. List all books.\n
    2. List all people.\n
    3. Create a person (teacher or student, not a plain Person).\n
    4. Create a book.\n
    5. Create a rental.\n
    6. List all rentals for a given person id.\n
    7. exit\n----------------------------"
end

def options(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    option3(app)
  when 4
    app.add_book
  when 5
    option5(app)
  when 6
    app.list_rentals
  else
    puts '---Invalid input---'
  end
end

def option3(app)
  print 'Do you want to creat a Student(1) or a Teacher(2)?[Input number]:'
  input = gets.chomp.to_i
  case input
  when 1
    case_option1(app)
  when 2
    case_option2(app)
  else
    puts '---Wrong Input---'
  end
end

def case_option1(app)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'classroom: '
  classroom = gets.chomp
  print 'has parent permission[Y/N]: '
  permission = gets.chomp
  app.add_student(classroom, age, name, permission)
end

def case_option2(app)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'specialization: '
  specialization = gets.chomp
  app.add_teacher(specialization, age, name)
end

def option5(app)
  if app.book_list.empty? || app.people_list.empty?
    puts 'Please enter books || people'
  else
    puts 'Please choose a book by number not ID'
    app.list_books
    book_index = gets.chomp.to_i
    book = app.book_list[book_index - 1]
    puts 'Please choose a person by number not ID'
    app.list_people
    person_index = gets.chomp.to_i
    person = app.people_list[person_index - 1]
    print 'Date: '
    date = gets.chomp
    app.add_rental(date, book, person)
  end
end

def main
  app = App.new
  exit = false
  while exit != true
    display_options
    option = gets.chomp.to_i
    if option == 7
      exit = true
    else
      options(option, app)
    end
  end
  app.run
end

main
