require "HelloWorld.rb"
require "test/unit"

class TestHelloWorld < Test::Unit::TestCase
    attr_accessor :test_class, :output

    def setup
        $stdout = StringIO.new
        @test_class = HelloWorld.new
        @output = String.new
    end
    
    def teardown
        $stdout = STDOUT
    end
    
    def test_solution
        test_class.run; output = $stdout.string.chomp.downcase
        assert_match('hello', output, "You should say hello!")
        assert_match('world', output, "You should say it to the world!")
    end
    
    def test_challenge_1
        test_class.challenge_1; output = $stdout.string.chomp.downcase
        assert_match('hello', output, "You should say hello!")
        assert_operator('Hello, R!'.length, '<', output.length, "I'm sure your name is longer than one letter...")
    end
    
    def test_challenge_2
        test_class.challenge_2; output = $stdout.string.chomp.length
        assert_equal(1, output, "You should only output a single character.")
    end

end