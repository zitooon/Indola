class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :username
      t.text :adress
      t.string :zip
      t.string :city
      t.string :hairdresser
      t.string :picture
      t.string :picture_title
      t.integer :note
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
