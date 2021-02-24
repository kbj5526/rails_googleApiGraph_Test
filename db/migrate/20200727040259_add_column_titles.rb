class AddColumnTitles < ActiveRecord::Migration[6.0]
  def change
    add_column :accesses, :application, :integer
  end
end
