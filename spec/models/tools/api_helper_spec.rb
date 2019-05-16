require "rails_helper"

describe Tools::ApiHelper do 
    context 'Should get the proper response' do
        it 'Should reach the API' do
            ah = Tools::ApiHelper.new("query=foo&tags=story")
            result = ah.get_page_data(1)
            expect(result["page"]).to be 1
        end
        
        it 'Should parse search results' do 
            q = "query=foo&tags=story"
            ah = Tools::ApiHelper.new(q)

            result = ah.get_search_results(1)
            expect(result.is_a? Hash).to be true 
            expect(result[:query].is_a? SearchQuery).to be true 
            expect(result[:results].is_a? Array).to be true 
            expect(result[:results][0].is_a? SearchResult).to be true 
            expect(result[:results][0].hn_author).to_not be nil 
        end
    end
end