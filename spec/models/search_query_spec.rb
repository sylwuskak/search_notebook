require "rails_helper"

describe SearchQuery do 
    context 'Should create SearchQuery only with query' do
        it 'Should not create SearchQuery without query' do
            sq = SearchQuery.new

            expect(sq.valid?).to be false
        end

        it 'Should create SearchQuery with query' do
            sq = SearchQuery.new(query_string: "test query")

            expect(sq.valid?).to be true
        end
    end

end