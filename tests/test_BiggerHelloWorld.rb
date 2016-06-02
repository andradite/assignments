require "test/unit"
require "BiggerHelloWorld.rb"
require "help_BiggerHelloWorld.rb"

class TestBiggerHelloWorld < Test::Unit::TestCase

    def setup        
        *args = String.new, String.new, String.new
        @test_input, @test_output, @test_error = args
        @help_input, @help_output, @help_error = args
        
        @message = String.new
        @test_class = BiggerHelloWorld.new
        @help_class = HelpBiggerHelloWorld.new
    end
    
    def teardown
        *args = STDIN, STDOUT, STDERR
        $stdin, $stdout, $stderr = args
    end
    
    def test_solution
        StringIO.open(String.new) do |stio|
            $stdout = stio; @help_class.run
            @help_output = $stdout.string.chomp
        end
        StringIO.open(String.new) do |stio|
            $stdout = stio; @test_class.run
            @test_output = $stdout.string.chomp
        end
        @message << "\nYou should be saying:\n#{@help_output}\n"
        @message << "\nnot saying:\n#{@test_output}\n"
        assert_equal("hello world", @test_output, @message)
    end

end