class SearchNotebook < ActiveRecord::Base
    has_many :search_results

    validates :title, presence: true
end