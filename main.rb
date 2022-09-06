require_relative './display'

def main_app_display
  display = Display.new
  loop do
    display.main_list
    useroption = gets.chomp.to_i
    case useroption
    when 1..6
      display.options(useroption)
    else
      break
    end
  end
end

main_app_display
