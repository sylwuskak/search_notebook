class StatisticsController < ApplicationController
    def get_statistics
        sc = Tools::StatisticCreator.new
        @statistics = sc.get_statistics
    end
end