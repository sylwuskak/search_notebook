module Tools
    class ApiHelper
        require 'net/http'
        require 'json'

        def initialize(query)
            @query = query 
        end

        def get_search_results(page)
            data = get_page_data(page)
            q =  SearchQuery.create!(
                query_string: data["query"],
                number_of_hits: data["nbHits"]
            )
            
            results = data["hits"].map do |hit|
                initialize_search_result(hit, q)
            end

            {:query => q, :results => results}
        end

        def initialize_search_result(result_data, query)
            SearchResult.new(
                hn_author: result_data["author"],
                url: result_data["url"],
                creation_date: Date.parse(result_data["created_at"]),
                hn_tags: result_data["_tags"].join(','),
                search_query: query
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