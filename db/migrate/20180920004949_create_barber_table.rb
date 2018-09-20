class CreateBarberTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :client, :clients
    create_table :barbers do |t|
      t.text :name
      
      t.timestamps
    end
  end

  Barber.create name: 'Jessy Pinkman'
  Barber.create name: 'Walter White'
  Barber.create name: 'Gus Fring'
end
