require "rails_helper"

describe SearchResult do 
    context 'Should create SearchResult only with all fields' do
        it 'Should not create SearchResult without all fields' do
            sr = SearchResult.new

            expect(sr.valid?).to be false
        end

        it 'Should create SearchResult with all fields' do
            sn = SearchNotebook.create!(title: "test title")

            sr = SearchResult.new(
                hn_author: "test author",
                author_karma_points: 99,
                url: "https://www.wsj.com/articles/maersk-tankers-turns-to-wind-power-to-cut-soaring-fuel-costs-1535641239",
                creation_date: Date.today,
                hn_tags: "tag1,tag2,tag3",
                search_query_id: "some_query",
                search_notebook: sn
            )

            expect(sr.valid?).to be true
        end
    end

end