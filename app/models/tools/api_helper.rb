module Tools
    class ApiHelper
        require 'net/http'
        require 'json'

        def initialize(query)
            @query = query 
        end

        def get_result(page)
            data = get_page_data(page)
            SearchQuery.create!(
                query_string: data["query"],
                number_of_hits: data["nbHits"]
            )
        end

        def get_page_data(page)
            url = "https://hn.algolia.com/api/v1/search?#{@query}&page=#{page}"
            uri = URI(url)
            response = Net::HTTP.get(uri)

            JSON.parse(response)
        end
    end

end