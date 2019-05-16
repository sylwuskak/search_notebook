class SearchResult < ActiveRecord::Base
    belongs_to :search_notebook
    belongs_to :search_query
    
    validates :hn_author, :author_karma_points, :url, :creation_date, :search_query_id, :search_notebook, presence: true

end