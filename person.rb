require './nameable.rb'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission ||= parent_permission
  end

  def can_use_services?
    of_age? or @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    age >= 18
  end
end
# -----------------

class Decorator < Nameable
  attr_accessor :nameable

  # @param [nameable] nameable
  def initialize(nameable)
    @nameable = nameable
  end

  # The Decorator delegates all work to the wrapped nameable.
  def correct_name
    @nameable.correct_name
  end
end

# Concrete Decorators call the wrapped object and alter its result in some way.
class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize()
  end
end

# Decorators can execute their behavior either before or after the call to a
# wrapped object.
class TrimmerDecorator < Decorator
  def correct_name
    @nameable.correct_name[0..8]
  end
end

person = Person.new(22, 'maximilianus')
  person.correct_name
  capitalizedPerson = CapitalizeDecorator.new(person)
  capitalizedPerson.correct_name
  capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
  capitalizedTrimmedPerson.correct_name