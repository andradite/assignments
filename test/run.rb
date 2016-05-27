class Test
    def initialize(*args)
        $stdout = StringIO.new;
        run();
    end
    
    def run()
        $stdout.puts "Hello, World!"
        $test_results = $stdout.string;
    end
    
    at_exit do
        $stdout = STDOUT;
        puts $test_results
    end
    
    new();
end
