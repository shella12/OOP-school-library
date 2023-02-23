require './person'
describe Person do
  let(:person) { Person.new(21, 'James') }
  it 'should return true when we call the can_use_services? method' do
    expect(person.can_use_services?).to be_truthy
  end
  it 'should return James when we call the correct_name method' do
    expect(person.correct_name).to eql('James')
  end
end
