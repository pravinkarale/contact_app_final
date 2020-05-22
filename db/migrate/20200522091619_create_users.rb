class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :locale, default: 'en'
      t.text :message
      t.timestamps
    end
  end
end
