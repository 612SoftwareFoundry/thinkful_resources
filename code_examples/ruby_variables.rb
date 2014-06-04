#
# Example of the different types of variables in Ruby
# Reading: http://www.tutorialspoint.com/ruby/ruby_variables.htm
#

# $global_variable is a global variable and is not recommended for use because
# it is not object oriented. global variables are accessible anywhere.
$global_variable = 42

class User

    # @@user_count and @user_type are class variables. class variables are accessible
    # throughout ALL instances of this class and must be initialized before they can be used.
    @@user_count = 0
    @@user_type = 'BASIC_USER'
    # Constants are upper case and cannot be changed
    IS_HUMAN = true

    def initialize(username)
         # @username and @id are instance variables and are accessible throughout THIS instance
        @username = username
        @@user_count += 1
        @id = @@user_count
    end

    def pretty_print
        puts "ID: #{@id}: Username is #{@username}. User type is #{@@user_type}. User is human: #{IS_HUMAN}."
    end

    # This is a class method, which is only accessible for the class, not the instances.
    # Note the use of 'self'
    def self.print_user_count_used
        puts "Last ID used was: #{@@user_count}"
    end

    def self.answer_to_everything_in_life
      puts "The answer to everything in life is #$global_variable"
    end

end

# creates a subclass of User
class AdminUser < User
  def initialize(username)
    super(username)
    # class variables can also be overridden by sub-classes, so be careful. all users would become admin
    # users, even the basic users. be careful!
    @@user_type = 'ADMIN_USER'
  end
end

# Creates a new basic user with username=jack, increments the class variable user_count and sets this instance's id to that value
jack = User.new('jack')
# Prints the info about this basic user
jack.pretty_print

# Creates a new admin user with username=joe, increments the class variable user_count and sets this instance's id to that value
joe = AdminUser.new('joe')
# Prints the info about this admin user
joe.pretty_print

# Creates a new basic user with username=jill, increments the class variable user_count and sets this instance's id to that value
jill = User.new('jill')
# Prints the info about this basic user, note that user type is incorrect
jill.pretty_print

# Prints the class variables @@user_count
User.print_user_count_used

# Prints the global variable
User.answer_to_everything_in_life

# These won't work because it is a class method and it cannot be called on an instance of User
#jack.print_user_count_used
#jill.print_user_count_used
#joe.print_user_count_used

# This won't work because it is an instance method and you need an instance of User to call it
#User.pretty_print
