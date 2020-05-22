require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
  	it 'ensure first name presence' do
  		user = User.new(last_name: 'desouza', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(user).to eq(false)
  	end

  	it 'ensure last name presence' do
  		user = User.new(first_name: 'maria', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(user).to eq(false)
  	end

  	it 'ensure email presence' do
  		user = User.new(first_name: 'maria', last_name: 'desouza', message: 'please revert me within a week').save
  		expect(user).to eq(false)
  	end

  	it 'ensure message presence' do
  		user = User.new(first_name: 'maria', last_name: 'desouza', email: 'mariad79@gmail.com').save
  		expect(user).to eq(false)
  	end

  	it 'record should save successfully' do
  		user = User.new(first_name: 'maria', last_name: 'desouza', email: 'mariad79@gmail.com', message: 'please revert me within a week').save
  		expect(user).to eq(true)
  	end

  end
end
