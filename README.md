#Welcome to Camp Andradite! [![Join the chat at https://gitter.im/andradite/assignments](https://badges.gitter.im/andradite/assignments.svg)](https://gitter.im/andradite/assignments?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This program is designed to help people of all backgrounds and levels of experience
to become become expert level programmers and field specialists. This is the beginning
of the program where we setup our systems, learn a bit about terminals, and write
our first few starter programs.

Below are some of the commands we will be using throught the course and a brief explanation of them.
The Custom Command section shows commands that we will be setting up in our IDEs
(interactive-development environments).

Follow along with your video or lecture notes to get started!

###Active Commands

cd: Changes current directory to specified directory.  
ls -lah: Displays the files/folders in current directory.  
rm -rf: Removes specified file/folder.  
mv: Moves or renames specified file/folder.  

cat: Creates a new file or displays its contents.  
echo: Append variable to a file or displays its contents.  
sudo: Run other commands as administrator or other user.  
wget: Downloads a file from the web.  
clear: Clears console.  



java: Calls the java runtime environment.  
java -jar: Calls the jar runtime.  
javac: Calls the java development environment.  

jirb: Calls the java interactive ruby bash/console.  
jruby: Calls the jruby runtime environment.  
jrubyb: Calls the ruby-to-java build environment.  
jrubyc: Calls the jruby development environment.  

###Custom Commands
#####setProject
    echo "project_path=\"${current.project.path}\"" >> ~/.bashrc &&
    echo "project=\"${current.project.relpath}\"" >> ~/.bashrc
#####setCommands
    echo "jruby=\"java -jar jruby\"" >> ~/.bashrc &&
    echo "jirb=\"java -jar jruby -S jirb\"" >> ~/.bashrc &&
    echo "jrubyb=\"java -jar jruby -S jrubyc --java\"" >> ~/.bashrc &&
    echo "jrubyc=\"java -jar jruby -S jruby --javac\"" >> ~/.bashrc
#####runProject
    $jruby $project_path/src/$project.rb
#####buildProject
    $jrubyb $project_path/src/$project.rb $project_path/src && mv /projects/$project.java $project_path/src/$project.java
#####compileProject
    $jrubyc $project_path/src/$project.rb
