class AddSortToPoems < ActiveRecord::Migration[5.1]
  def change
    add_column :poems, :sort, :integer
  end
end
