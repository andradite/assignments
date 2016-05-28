load 'assignments/DEPENDS'

class Test
    def initialize(*args)
        $tests = Array.new;
        $results = Hash.new;
        File.open( $TEST+"README.md", "r" ) do |file|
            file.gets;
            file.each_line do |line|
                $tests << line.chomp;
                $results[:"#{line.chomp}"] = 'Not Tested!';
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
        $results[:"#{test}"] = 'Passed!';
        send( :"#{test}" );
    end
    
    def all()
        $tests -= ['all', 'exit'];
        $tests.each do |test|
            run(test);
        end
    end
    

    
    def solution()
        ( $results[:solution] = 'Failed!' ) unless $stdout.string == $stdtest.string;
        exit unless $results[:solution] == 'Passed!';
    end
    
    def challenge_1()
        exit unless $results[:challenge_1] == 'Passed!';
    end
    
    at_exit do
        system( 'clear ');
        $results.each do |key, value|
            STDOUT.puts("#{key} => #{value}");
        end
    end
    
    new();
end
