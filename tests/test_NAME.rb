require "NAME.rb"
require "test/unit"

class TestNAME < Test::Unit::TestCase

    def setup
        $stdout = StringIO.new
    end
    
    def teardown
        $stdout = STDOUT
    end
    
    def test_main
        Main.run; output = $stdout.string.chomp
        assert_equal('Hello, World!', output)
    end

end