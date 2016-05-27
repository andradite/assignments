class Test
    def initialize(*args)
        $tests = Array.new;
        $results = 0;
        File.open( "assignments/test/TESTS", "r" ) do |file|
            file.each_line do |line|
                $tests << line.chomp;
            end
            $tests << "all" << "exit";
        end
        system( 'clear' );
        run();
    end
    
    def run()
        puts( "Available Tests: #{$tests}" );
        print( "Which test would you like to run? " );
        $stdout = $stdtest = StringIO.new;
        send( :"#{gets.chomp}" );
    end
    
    def all()
        $tests -= ['all', 'exit'];
        $tests.each do |test|
            send( :"#{test}" );
        end
    end
    
    def solution()
        load 'assignments/help/solution.rb'
        $stdout = StringIO.new;
        load 'assignments/src/main.rb'
        ( $results += 1 ) unless $stdout.string == $stdtest.string;
    end
    
    def challenge_1()
        load 'assignments/help/solution.rb'
        load 'assignments/src/main.rb'
        ( $results += 1 );
    end
    
    at_exit do
        STDOUT.puts( $results );
    end
    
    new();
end
