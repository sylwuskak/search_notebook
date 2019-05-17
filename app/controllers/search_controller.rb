class SearchController < ApplicationController
    def search_results_view
        begin 
            unless (params["query"].nil?)
                @search_notebooks = SearchNotebook.all
                ah = Tools::ApiHelper.new(params["query"])
                @search_data = ah.get_search_results(params["page"] || 1)
            end
        rescue => e 
            flash[:danger] = "#{e.message}"
        end 
    end
end