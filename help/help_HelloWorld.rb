class HelloWorld
    def run(*args)
        $stdout.puts( "Hello, World!" );    #~ outputs 'Hello, World!' to the console
    end    
end

class HelloWorld
    def challenge_1
        $stdout.puts( "Hello, Rickey!" );   #~ outputs 'Hello, Rickey!' to the console
    end
end

class HelloWorld
    def challenge_2
        $stdout.putc( "Hello, World!" );    #~ outputs the single character 'H' to the console
    end
end

program = HelloWorld.new