require "NAME.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase
    attr_accessor :test_class, :output
    
    def setup
        $stdout = StringIO.new
        @test_class = NAME.new
        @output = String.new
    end
    
    def teardown
        $stdout = STDOUT
    end
    
    def test_solution
        test_class.run
        output = $stdout.string.chomp
        assert_equal('Hello, World!', output)
    end

end