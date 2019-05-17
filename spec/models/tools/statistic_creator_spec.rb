require "rails_helper"

describe Tools::StatisticCreator do 
    context 'Should get the proper response' do
        it 'Should count statistic' do
            q = "query=foo&tags=story"
            ah = Tools::ApiHelper.new(q)

            ah.get_search_results(1)

            sc = Tools::StatisticCreator.new
            response = sc.get_statistics

            expect(response.is_a? Array).to be true 
            response.length.should eq(SearchQuery.all.length)
        end
    end
end


