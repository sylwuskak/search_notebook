require "rails_helper"

describe SearchNotebook do 
    context 'Should create SearchNotebook only with title' do
        it 'Should not create SearchNotebook without title' do
            sn = SearchNotebook.new

            expect(sn.valid?).to be false
        end

        it 'Should create SearchNotebook with title' do
            sn = SearchNotebook.new(title: "test title")

            expect(sn.valid?).to be true
        end
    end


end