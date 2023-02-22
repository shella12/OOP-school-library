require './app'
require './choices'

include Choices

def main 
    app = App.new
    loop do
      display_options
      option = gets.chomp.to_i
      exit if option == 7
        options(option, app)
    end
    app.run
  end
  
  main
  