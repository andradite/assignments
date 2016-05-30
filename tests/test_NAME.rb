require "test/unit"
require "NAME.rb"
require "help_NAME.rb"

class TestNAME < Test::Unit::TestCase

    def setup        
        *args = String.new, String.new, String.new
        @test_input, @test_output, @test_error = args
        @help_input, @help_output, @help_error = args
        
        @message = String.new
        @test_class = NAME.new
        @help_class = HelpNAME.new
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
        @message << "Your output is incorrect!\n"
        assert_equal(@help_output, @test_output, @message)
    end

end
