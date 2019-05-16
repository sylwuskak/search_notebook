class SearchNotebooksController < ApplicationController
    before_action :set_notebook, only: [:show, :update]

    def index
        @search_notebooks = SearchNotebook.all
    end

    def show

    end

    def create
        begin
            n = SearchNotebook.create!(notebook_params)
        rescue => e 
            flash[:danger] = "Creating failed: #{e.message}"
        end 
        
        redirect_to root_path
    end

    def update
        begin
            @notebook.update!(notebook_params)
        rescue => e 
            flash[:danger] = "Creating failed: #{e.message}"
        end 
        
        redirect_to root_path
    end

    def destroy 
        begin
            SearchNotebook.destroy(params[:id])
            redirect_to root_path 
        rescue => e 
            flash[:danger] = "Destroying failed: #{e.message}"
        end
        redirect_to root_path 
    end

    private 
    def notebook_params
        params.require(:search_notebook).permit(:title)
    end

    def set_notebook
        @notebook = SearchNotebook.find params[:id]
    end

end
