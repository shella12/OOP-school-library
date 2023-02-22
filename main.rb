require './app'
require './choices'

def main
  app = App.new
  choice = Choices.new
  loop do
    choice.display_options
    option = gets.chomp.to_i
    exit if option == 7
    choice.options(option, app)
  end
end

main
