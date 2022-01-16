#!/usr/bin/env ruby

class String 
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end

    def brown
        colorize(33)
    end

    def green
        colorize(32)
    end

    def grey
        colorize(37)
    end
end

class Wordle
    @@attempts = ["▩ ▩ ▩ ▩ ▩", "▩ ▩ ▩ ▩ ▩", "▩ ▩ ▩ ▩ ▩", "▩ ▩ ▩ ▩ ▩", "▩ ▩ ▩ ▩ ▩", "▩ ▩ ▩ ▩ ▩"]
    @@answer = "MAGIC"
    # @@input = ""
    @@turn = 0
    @@max_turns = 6

    def start
        puts "* W O R D L E *"
        puts @@attempts
        turn = 0
        input = ""
        while turn < @@max_turns && input != @@answer do
            input = gets.chomp.upcase()
            if input.empty? || input.size != 5
                puts "Invalid input"
            else 
                @@attempts[turn] = color_code(input)
                turn += 1
                puts "-------------"
                puts @@attempts
                puts "-------------"
            end
        end
    end

    def color_code(attempt) 
        result = ""
        for index in 0..4 do
            if @@answer[index] == attempt[index]
                result += (attempt[index].green + " ")
            elsif @@answer.include? attempt[index]
                result += (attempt[index].brown + " ")
            else
                result += (attempt[index].grey + " ")
            end
        end
        result
    end

end    



# if __FILE__ == $0
    wordle = Wordle.new
    wordle.start
# end