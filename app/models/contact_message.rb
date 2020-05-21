class ContactMessage < ApplicationRecord
	validates :first_name, :last_name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }, allow_blank: true
end
