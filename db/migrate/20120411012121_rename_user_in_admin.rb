class RenameUserInAdmin < ActiveRecord::Migration
  def up
    rename_table :users, :admin_users
  end

  def down
  end
end
