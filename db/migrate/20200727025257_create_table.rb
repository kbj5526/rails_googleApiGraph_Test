class CreateTable < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :gender

      t.timestamps
    end
    create_table :accesses do |t|
      t.references :user, null: false, foreign_key: true
      t.date :access_date

      t.timestamps
    end
    create_table :devices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :device_name

      t.timestamps
    end
  end
end
