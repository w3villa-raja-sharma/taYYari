# class AddOmniauthToUsers < ActiveRecord::Migration[7.1]
#   def change
#     add_column :users, :provider, :string
#     add_column :users, :uid, :string
#   end
# end


class AddOmniauthToUsers < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:users, :provider)
      add_column :users, :provider, :string
    end

    unless column_exists?(:users, :uid)
      add_column :users, :uid, :string
    end
  end
end

