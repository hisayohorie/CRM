require_relative 'contact'
require 'sinatra'


get '/' do
  @crm_app_name = "Hisayo's CRM"
  erb :index
end# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
get '/contacts' do
  Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
  Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
  Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
  erb :contacts
end

get '/contacts/new_contact' do
   new_contact = Contact.create('first_name','last_name','email','note')

  erb :new_contact
end
