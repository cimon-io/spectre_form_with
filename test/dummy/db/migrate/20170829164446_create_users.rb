class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.boolean :superhero
      t.text :about
      t.string :phone_number
      t.date :birth_date
      t.string :birth_week
      t.string :birth_month
      t.datetime :joined_at
      t.integer :favorite_number
      t.string :favorite_color
      t.string :homepage

      t.timestamps
    end
  end
end
