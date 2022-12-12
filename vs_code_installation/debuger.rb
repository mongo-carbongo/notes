# Requirement
# You need to install latest debug gem and rdbg command should be in $PATH.

gem install debug

# Also in the folder where you are working your json file must be clear:

.vscode/launch.json
# {
#     // Use IntelliSense to learn about possible attributes.
#     // Hover to view descriptions of existing attributes.
#     // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
#     "version": "0.2.0",
# }

# Print the directory of an installed gem
gem which debug
# /home/mauro/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/lib/debug.rb

# Look at your gem environment.
#
# In a terminal run:

gem env

# You should see an entry INSTALLATION DIRECTORY, but there is also GEM PATHS
# which is where it's loading all your gems from in your current environment.

 INSTALLATION DIRECTORY: /home/mauro/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0

 ~/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/exe/rdbg

# Print in console the path environment variable
echo $PATH

# In order to set a value to an existing environment variable, we use an
# assignment expression. For instance, to set the value of the "LANG" variable
# to "he_IL.UTF-8", we use the following command:

LANG=he_IL.UTF-8

# If we use an assignment expression for a variable that doesn't exist,
# the shell will create a shell variable, which is similar to an environment
# variable but does not influence the behaviour of other applications.

# A shell variable can be exported to become an environment variable with
# the export command. To create the "EDITOR" environment variable and assign
# the value "nano" to it, you can do:


EDITOR=nano
export EDITOR

# The bash shell (the default command-line shell in Ubuntu) provides a shortcut
# for creating environment variables. The previous example could be performed
# with the following single command:

export EDITOR=nano

export PATH=$PATH:/home/mauro/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/lib/debug.rb
export PATH=$PATH:/home/mauro/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/exe/rdbg
# Bash Shell
# Edit the startup file (~/.bashrc)

nano .bashrc

# add this line
export PATH="$HOME/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/lib/debug.rb:$PATH"
export PATH="$HOME/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/debug-1.6.3/exe/rdbg:$PATH"

# let's say, you want to remove the directory /home/wrong/dir/ from your PATH
# variable, assuming it's at the end:

PATH=$(echo "$PATH" | sed -e 's/:\/home\/wrong\/dir$//')

# Step in: means that if there is a function call, it goes inside the function
# and you can see how the function is executing line by line till it returns and
# you go back to the next line right after the function call.
#
# Step over: means that if there is a function call, it just executes it like a
# black box and returns the result, but you cannot see how the function was
#  executed.
#
# Step out: means that if you have Stepped in a function and now you want to
#  skip
#  seeing how the rest of the function is going to execute, you Step out and the
#  function returns. Then, you go back to the next line, that is the line right
#  after the function call.
