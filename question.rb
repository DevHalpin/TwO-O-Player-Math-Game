class Question
    def initialize
        @num1 = rand(1..20)
        @num2 = rand(1..20)
        @sum = @num1 + @num2
    end

    def print_question(name)
        puts ("#{name}: What does #{@num1} plus #{@num2} equal?")
    end

    def check_response(input)
        @sum == input
    end
end
