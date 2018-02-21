class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :agent_id, :integer
    add_column :users, :type, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :text
  end
end
