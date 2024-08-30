class CreateTableEmployee < ActiveRecord::Migration[7.1]
  def change
    create_table :table_employees do |t|

      t.timestamps
    end
  end
end
