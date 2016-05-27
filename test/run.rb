load 'assignments/DEPENDS'

class Test
    def initialize(*args)
        $tests = Array.new;
        $results = 0;
        File.open( $TEST+"TESTS", "r" ) do |file|
            file.each_line do |line|
                $tests << line.chomp;
            end
            $tests << "all" << "exit";
        end
        system( 'clear' );
        puts( "Available Tests: #{$tests}" );
        print( "Which test would you like to run? " );
        run(gets.chomp);
    end
    
    def run(test)
        all if test == 'all';  exit if test == 'exit';
        $stdout = $stdtest = StringIO.new;
        load $HELP+test+'.rb'
        $stdout = StringIO.new;
        load $SRC+'main.rb'
        send( :"#{test}" );
    end
    
    def all()
        $tests -= ['all', 'exit'];
        $tests.each do |test|
            run(test);
        end
    end
    

    
    def solution()
        ( $results = 413 ) unless $stdout.string == $stdtest.string;
        exit unless $results == 0;
    end
    
    def challenge_1()
        ( $results = 22 ) unless $stdout.string;
        exit unless $results == 0;
    end
    
    def challenge_2()
        ( $results = 141 );
    end
    
    at_exit do
        STDOUT.puts( $results );
    end
    
    new();
end
