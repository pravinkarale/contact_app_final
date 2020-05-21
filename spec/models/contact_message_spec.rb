require 'rails_helper'

RSpec.describe ContactMessage, type: :model do

  context 'validation tests' do 
  	it 'ensure first name presence' do
  		contact = ContactMessage.new(last_name: 'desouza', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(contact).to eq(false)
  	end

  	it 'ensure last name presence' do
  		contact = ContactMessage.new(first_name: 'maria', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(contact).to eq(false)
  	end

  	it 'ensure email presence' do
  		contact = ContactMessage.new(first_name: 'maria', last_name: 'desouza', message: 'please revert me within a week').save
  		expect(contact).to eq(false)
  	end

  	it 'ensure message presence' do
  		contact = ContactMessage.new(first_name: 'maria', last_name: 'desouza', email: 'mariad79@gmail.com').save
  		expect(contact).to eq(false)
  	end

  	it 'record should save successfully' do
  		contact = ContactMessage.new(first_name: 'maria', last_name: 'desouza', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(contact).to eq(true)
  	end

  end
end
