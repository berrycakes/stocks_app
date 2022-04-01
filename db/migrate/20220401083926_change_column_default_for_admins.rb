class ChangeColumnDefaultForAdmins < ActiveRecord::Migration[6.1]
  def change
    change_column_default :admins, :first_name, ''
    change_column_default :admins, :last_name, ''
    change_column_default :admins, :mobile_number, ''
  end
end
