class CreateClientTable < ActiveRecord::Migration[5.2]
  def change
    create_table :client do |t|
      t.text :name
      t.text :phone
      t.datetime :date
      t.text :barber

      t.timestamps
    end
  end
end
