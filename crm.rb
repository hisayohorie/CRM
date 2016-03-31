require_relative 'contact'

class CRM
@@crm = Contact.all #<= CRM is the class to navigate the contact so always need all contact except id.

  def self.run(name) #<= this is the only time I need class method to self start
    # Fill this in
    crm = CRM.new(name)  #<= create CRM starting with the name input that have access to Contacts
    crm.main_menu #<= indicate the use for the prompts
  end

  def initialize(name)
    @name = name #<= starting up a class instances by name
    # Fill this in
  end

  def main_menu
    # Fill this in
    while true #<= exit is the false condition
      print_main_menu #<= to see the main_menu below
      user_selected = gets.to_i #<= to search by id make it to integer
      call_option(user_selected) #<= input from the user
    end
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Update an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all contact"
    puts "[5] Search contact by attribute"
    puts "[6] Exit"
    # Fill this in
  end

  def call_option(user_selected) #<= assigning action to each methods
    # Fill this in
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then abort("Exited the menu")
      else puts "You enter a wrong number."
    end
  end

  def add_new_contact
    # Fill this in
    puts "Enter first name"
    first_name = gets.chomp
    puts "Enter last name"
    last_name = gets.chomp
    puts "Enter email address"
    email = gets.chomp
    puts "Enter any additional info"
    note = gets.chomp
    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    # Fill this in
    puts "Enter the ID of the contact you want to update"
    selected_id = gets.to_i
    modify_id = Contact.find(selected_id) #<= method from contact.rb
    "#{modify_id} is the ID you wish to change? Put Y for yes, N for no"
    confirmation = gets.chomp
    if confirmation.downcase == "y"
      puts "What attribute do you want to update? choose [1]first name, [2]last name, [3]email, or [4]note"
      new_value = gets.chomp
      case direction
        when 1 then Contact.update(first_name, new_value)
        when 2 then Contact.update(last_name, new_value)
        when 3 then Contact.update(email, new_value)
        when 1 then Contact.update(note, new_value)
      end
    elsif confirmation.downcase =="n"
          modify_existing_contact
    else
        puts "Wrong input."
    end
  end

  def delete_contact
    # Fill this in
    puts "Enter ID of the contact you want to delete"
    delete_id = gets.to_i
    contact_delete = @@contacts.find(delete_id)
    contact_delete.delete
  end
  #
  def display_all_contacts
    # Fill this in
    # HINT: Make use of the display_contacts method
    @@contacts.all
  end
  #
  def search_by_attribute
    # Fill this in
    puts "How do you want to search your contact? Choose [1]first name, [2]last name, [3]email, or [4]note"
    search_attribute = gets.chomp



    # HINT: Make use of the display_contacts method
  end
  #
  # # This method should accept as its argument an array of contacts
  # # and display each contact in the contacts array
  # def display_contacts(contacts)
  #   # Fill this in
  #   # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods
  #
  # end
  #
  # # Add other methods here, if you need them.

end
 CRM.run 'Bitmaker CRM'

# Run the program here (See 'Using a class method`)
