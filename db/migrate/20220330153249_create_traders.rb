class CreateTraders < ActiveRecord::Migration[6.1]
  def change
    create_table :traders do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.boolean :approved, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
