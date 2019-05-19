class TestsController < ApplicationController
    def tests
    end

    def check_data
        begin 
            SearchResult.all.each do |result|
                r = Tools::ApiHelper.check_data_correction(result)
                unless r.nil?
                    result.update!(r.attributes)
                    flash[:success] = "Results updated"
                end
            end
        rescue => e 
            flash[:danger] = "#{e.message}"
        end 
        redirect_to tests_path
    end
end