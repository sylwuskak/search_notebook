module Tools
    class ApiHelper
        require 'net/http'
        require 'json'

        def self.get_author_karma_points(author)
            response = Net::HTTP.get(URI("https://hn.algolia.com/api/v1/users/#{author.to_s}"))

            r = JSON.parse(response)
            r["karma"]
        end

        def self.check_data_correction(result)
            karma = Tools::ApiHelper.get_author_karma_points(result.hn_author)

            response = Net::HTTP.get(URI("https://hn.algolia.com/api/v1/search?tags=author_#{result.hn_author.to_s}&numericFilters=created_at_i=#{result.creation_date.to_i}"))

            r = JSON.parse(response)
            result_data = r["hits"].first
            if result_data.nil?
                return nil;
            end

            new_result = SearchResult.new(
                hn_author: result_data["author"],
                url: result_data["url"],
                creation_date: DateTime.parse(result_data["created_at"]),
                hn_tags: result_data["_tags"].join(','),
                search_query: query, 
                author_karma_points: karma
            )

            if new_result.attributes.except('id', 'created_at', 'updated_at') != result.attributes.except('id', 'created_at', 'updated_at')
                return new_result
            end

            nil
        end

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
                creation_date: DateTime.parse(result_data["created_at"]),
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