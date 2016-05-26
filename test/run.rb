class Test
    def self.run(*args)
        $test_results = 0;
    end
    
    at_exit do
        puts $test_results
    end
end
