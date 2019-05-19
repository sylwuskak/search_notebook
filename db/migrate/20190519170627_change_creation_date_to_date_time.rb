class ChangeCreationDateToDateTime < ActiveRecord::Migration[5.2]
  def change
    change_column :search_results, :creation_date, :datetime
  end
end
