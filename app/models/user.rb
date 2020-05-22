class User < ApplicationRecord
	validates :first_name, :last_name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }, allow_blank: true

  after_create_commit :send_message_via_email

  def full_name
    [first_name, last_name].join(" ")
  end

  def send_message_via_email
    MessageDeliveryJob.perform_later(self)
  end
end