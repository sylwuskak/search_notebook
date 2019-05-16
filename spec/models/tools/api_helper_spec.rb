require "rails_helper"

describe Tools::ApiHelper do 
    context 'Should get the proper response' do
        it 'Should reach the API' do
            ah = Tools::ApiHelper.new("query=foo&tags=story")
            result = ah.get_page_data(1)
            expect(result["page"]).to be 1
        end

        it 'Should get SearchQuery entity' do
            q = "query=foo&tags=story"
            ah = Tools::ApiHelper.new(q)
            result = ah.get_result(1)

            expect(result.is_a? SearchQuery).to be true 
            expect(result.query_string).to eq "foo"
        end
    end
end