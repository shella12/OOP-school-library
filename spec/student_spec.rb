require './student'

describe Student do
  it 'should return ¯(ツ)/¯ when we call play_hooky method' do
    student = Student.new('B1', 12)
    expect(student.play_hooky).to eql('¯(ツ)/¯')
  end
end
