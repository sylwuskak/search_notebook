class ChangeQueryResultType < ActiveRecord::Migration[5.2]
  def change
    remove_column :search_results, :search_query_id

    add_reference :search_results, :search_query, foreign_key: true
  end
end
