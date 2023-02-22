require './teacher'

describe Teacher do

  it 'should return true when we call can_use_services? method' do
    teacher = Teacher.new('Biology', 12)
    expect(teacher.can_use_services?).to be_truthy
  end
end
