class CreateEntitiesTables < ActiveRecord::Migration[5.2]
  def change  
    create_table :search_notebooks do |t|
      t.string :title, null: false

      t.timestamps
    end 

    create_table :search_queries do |t|
      t.string :query_string, null:false
      t.integer :number_of_hits

      t.timestamps
    end
    
    create_table :search_results do |t|
      t.string :hn_author, null: false
      t.integer :author_karma_points, null: false
      t.string :url, null: false
      t.date :creation_date, null: false
      t.string :hn_tags
      t.string :search_query_id, null: false

      t.references :search_notebook, null: false
      t.timestamps
    end

  end
end
