class AddLocaleColumnToContactMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :contact_messages, :locale, :string, default: 'en'
  end
end
