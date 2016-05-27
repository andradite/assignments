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
        ( $results[:challenge_1] = "Say Hello!" ) unless $stdout.string.include?( "Hello" );
        ( $results[:challenge_1] = "Use Your Name, Not 'World'!" ) if $stdout.string.include?( "World" );
        ( $results[:challenge_1] = 'Wrong Length!' ) unless $stdout.string.length > "Hello, X!".length;
        exit unless $results[:challenge_1] == 'Passed!';
    end
    
    def challenge_2()
        ( $results[:challenge_2] = 'Wrong Length!' ) unless $stdout.string.length == $stdtest.string.length;
        exit unless $results[:challenge_2] == 'Passed!';
    end
    
    at_exit do
        system( 'clear ');
        $results.each do |key, value|
            STDOUT.puts("#{key} => #{value}");
        end
    end
    
    new();
end
