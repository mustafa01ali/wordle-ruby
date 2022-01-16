#!/usr/bin/env ruby

require './wordlist.rb'

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
    @@answer = ""
    @@turn = 0
    @@MAX_TURNS = 6

    def start
        @@answer = WORDS[rand(WORDS.size - 1)].upcase
        puts @@answer

        puts "\n* W O R D L E *"
        puts @@attempts
        puts "---------"
        turn = 0
        input = ""
        while turn < @@MAX_TURNS && input != @@answer do
            input = gets.chomp().upcase
            if input.empty? || input.size != 5 || !(WORDS.include?(input.downcase))
                puts "Invalid input"
            else
                @@attempts[turn] = color_code(input)
                turn += 1
                puts "---------"
                puts @@attempts
                puts "---------"
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

Wordle.new.start
