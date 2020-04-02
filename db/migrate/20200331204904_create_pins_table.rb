class CreatePinsTable < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :source
      t.string :catagory
      t.string :catagory_source
      t.string :pin
      t.integer :user_id      
    end
  end
end
