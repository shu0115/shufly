class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :group_id
      t.string :name
      t.integer :group_number
      t.integer :order_number

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
