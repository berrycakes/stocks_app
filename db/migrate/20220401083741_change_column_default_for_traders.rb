class ChangeColumnDefaultForTraders < ActiveRecord::Migration[6.1]
  def change
    change_column_default :traders, :first_name, ''
    change_column_default :traders, :last_name, ''
    change_column_default :traders, :mobile_number, ''
  end
end
