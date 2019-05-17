class SearchResultsController < ApplicationController
    before_action :set_result, only: [:show]

    def show

    end

    def create
        begin
            r = SearchResult.new(result_params)
            r.search_query_id = params['search_query_id']
            r.url = params['url']
            r.author_karma_points = Tools::ApiHelper.get_author_karma_points(r.hn_author)
            r.save!

            flash[:success] = "The result was saved"
        rescue => e 
            flash[:danger] = "Saving failed: #{e.message}"
        end 
       
       redirect_back fallback_location: search_results_view_path(query: params['query'] , page: params['page'] )
    end

    def destroy 
        begin
            SearchResult.destroy(params[:id])
        rescue => e 
            flash[:danger] = "Destroying failed: #{e.message}"
        end
        redirect_to search_results_path 
    end

    private 
    def result_params
        params.require(:search_result).permit(:hn_author, :creation_date, :hn_tags, :search_notebook_id)
    end

    def set_result
        @result = SearchResult.find params[:id]
    end

end
