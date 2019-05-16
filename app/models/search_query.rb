class SearchQuery < ActiveRecord::Base
    validates :query_string, presence: true    
end