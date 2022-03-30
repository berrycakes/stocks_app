class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.boolean :approved, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
