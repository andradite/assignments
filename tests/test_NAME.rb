require "./help/help_NAME.rb"
require "NAME.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase

    def setup        
        *args = String.new, String.new, String.new
        @test_input, @test_output, @test_error = args
        @help_input, @help_output, @help_error = args
        
        @test_class = NAME.new
        @help_class = HelpNAME.new
    end
    
    def teardown
        $stdin, $stdout, $stderr = STDIN, STDOUT, STDERR
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
        assert_equal(@help_output, @test_output, "Your output is incorrect!")
    end

end