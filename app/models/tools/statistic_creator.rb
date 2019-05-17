module Tools
    class StatisticCreator
        def get_statistics
            queries = SearchQuery.all.select{|q| q.created_at.to_date >= Date.today-6.days}
     
            puts SearchQuery.all.first.inspect
            queries.group_by{|q| q.query_string}.map do |query_string, search_queries|
                search_queries_last_day = search_queries.select{|q| q.created_at.to_date == Date.today-1.day}
                average_week = search_queries.length == 0 ? nil : (search_queries.map{|q| q.number_of_hits}.sum)/search_queries.length
                average_day = search_queries_last_day.length == 0 ? nil : (search_queries_last_day.map{|q| q.number_of_hits}.sum)/search_queries_last_day.length
                
                {
                    :query_string => query_string, 
                    :average_week => average_week,
                    :average_day => average_day
                }
            end
        end
    end
end