class AddNullToCustomers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :customers, :last_name, :string, null: false
    change_column_null :customers, :first_name, :string, null: false
    change_column_null :customers, :last_name_kana, :string, null: false
    change_column_null :customers, :first_name_kana, :string, null: false
    change_column_null :customers, :postcode, :string, null: false
    change_column_null :customers, :address, :string, null: false
    change_column_null :customers, :phone_number, :string, null: false
    change_column_null :customers, :is_deleted, :boolean, null: false, default: "false"
  end
end
