# rails installed on windows via:
# https://gorails.com/setup/windows/10

cd /mnt/c/users/mauro/projects

# Installing the Windows Subsystem for Linux
# Windows 10 allows you to run various Linux operating systems inside of Windows
# similar to a virtual machine, but natively implemented. We'll use this to
# install Ruby and run our Rails apps.
#
# Open Powershell as Administrator and run:

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Next install Ubuntu from the Microsoft Store.

# ow open Ubuntu in the Start menu or by running wsl in PowerShell or the command
#  prompt. You'll be asked to setup a new user for Ubuntu. Remember this password
#  as it's what you'll use later on when installing packages with sudo.

# Installing Ruby
# Choose the version of Ruby you want to install:
#
#
# 3.1.2 (Recommended)
# The first step is to install some dependencies for Ruby.

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev

# Next we're going to be installing Ruby with a version manager called Rbenv.
#
# Installing with rbenv is a simple two step process. First you install rbenv,
# and then ruby-build:

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

# This script can fail so it's recommended to clone from git and Then
# add the variables to the $PATH

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# Bash Shell
# Edit the startup file (~/.bashrc)

nano .bashrc

# add this line
export PATH="$HOME//.rbenv/bin:$PATH"

# restart the terminal

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
nano .bashrc

# add this line
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

# To install Ruby and set the default version, we'll run the following commands:
rbenv install 3.1.2
rbenv global 3.1.2
# Confirm the default Ruby version matches the version you just installed.
ruby -v
# The last step is to install Bundler

gem install bundler
# rbenv users need to run rbenv rehash after installing bundler.

# Configuring Git
# We'll be using Git for our version control system so we're going to set it
# up to match our Github account. If you don't already have a Github account,
#  make sure to register. It will come in handy for the future.
#
# Replace my name and email address in the following steps with the ones you used
# for your Github account.

git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"

# next step is to auhenticate with new github system

Installing Rails
Choose the version of Rails you want to install:


7.0.4 (Recommended)
Since Rails ships with so many dependencies these days, we're going to need to
install a Javascript runtime like NodeJS and a package manager called Yarn.

To install NodeJS and Yarn, we're going to add it using the official repository:

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt-get install -y nodejs yarn
And now, without further adieu:

gem install rails -v 7.0.4
If you're using rbenv, you'll need to run the following command to make the rails executable available:

rbenv rehash
Now that you've installed Rails, you can run the rails -v command to make sure you have everything installed correctly:

rails -v
# Rails 7.0.4
If you get a different result for some reason, it means your environment may not be setup properly.

Setting Up PostgreSQL
The easiest way to setup PostgreSQL is to install it on Windows using one of the Windows installers. You'll be able to run it in Windows and connect to it through Linux.

Download PostgreSQL for Windows and install it.

Pay attention to the username and password you setup during installation of Postgres as you will use this to configure your Rails applications later to login to Postgres when your Rails app runs.

You'll also need to install the development headers on Ubuntu so you can install the pg gem.

sudo apt install libpq-dev
Final Steps
The best place to develop Rails apps on the Windows Subsystem for Linux is to navigate to `/mnt/c`. This is actually the C: drive on Windows and it lets you use Sublime, Atom, VS Code, etc on Windows to edit your Rails application.

And now for the moment of truth. Let's create your first Rails application:

# Navigate to the C: drive on Windows. Do this every time you open the Linux console.
cd /mnt/c

# Create a code directory at C:\code for your Rails apps to live (You only need to do this once)
mkdir -p code

#### If you want to use Postgres
# Note that this will expect a postgres user with the same username
# as your app, you may need to edit config/database.yml to match the
# user you created earlier
rails new myapp -d postgresql

#### or if you want to use SQLite (not recommended)
# rails new myapp

#### Or if you want to use MySQL
# rails new myapp -d mysql

# Then, move into the application directory
cd myapp

# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified

# Create the database
rake db:create

rails server
You can now visit http://localhost:3000 to view your new website!

Now that you've got your machine setup, it's time to start building some Rails applications!

If you received an error that said Access denied for user 'root'@'localhost' (using password: NO) then you need to update your config/database.yml file to match the database username and password.

To edit your code in Windows: open up Sublime, Atom, VS Code, or whatever editor your prefer and point them to your folders in C:\code and you'll be able to safely edit your Rails apps in Windows and run them in Linux!

When you create a new Rails app, you might run into the following error: parent directory is world writable but not sticky.

If you run into this issue, you can run chmod +t -R ~/.bundle and that should fix the permissions errors and let you finish the bundle install for your Rails app.

That's it! Let us know in the comments below if you run into any issues or have any other protips to share!.
