require './person'

describe CapitalizeDecorator do
  it 'Captalize the incoming sting when we call correct_name method' do
    person = Person.new(12, 'jin')
    capitalize_name = CapitalizeDecorator.new(person)
    expect(capitalize_name.correct_name).to eql('Jin')
  end
end
