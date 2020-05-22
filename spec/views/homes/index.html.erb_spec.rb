require 'rails_helper'

RSpec.describe "homes/index.html.erb", type: :view do
  context "check form in English and Spanish language" do
  	it 'check form in English' do
  		I18n.locale = 'en'
  		render
			expect(rendered).to have_text('Send Us A Message')
		end

		it 'check form in Spanish' do
  		I18n.locale = 'es'
  		render
			expect(rendered).to have_text('Mandanos un mensaje')
		end
  end
end
