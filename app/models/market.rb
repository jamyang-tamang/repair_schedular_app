class Market < ApplicationRecord
    def index
        @markets = Market.all
    end
    has_many :vehicles
end
