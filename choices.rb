class Choices
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
      list_of_books(app)
    when 2
      list_of_people(app)
    when 3
      create_person(app)
    when 4
      add_a_book(app)
    when 5
      create_rental(app)
    when 6
      list_of_rentals(app)
    else
      puts '---Invalid input---'
    end
  end

  def list_of_books(app)
    app.list_books
  end

  def list_of_people(app)
    app.list_people
  end

  def create_person(app)
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

  def add_a_book(app)
    app.add_book
  end

  def create_rental(app)
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

  def list_of_rentals(app)
    app.list_rentals
  end
end
