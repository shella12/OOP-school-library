require './classroom'
require './student'
describe Classroom do
  it "should return instance of 'Student' when we call the add_students method" do
    classroom = Classroom.new('B1')
    student = Student.new('B1', 12)
    expect(classroom.add_students(student)).to eql(student.classroom)
  end
end
