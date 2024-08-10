class Stock < ApplicationRecord
  include HTTParty

  has_many :user_stocks
  has_many :users, through: :user_stocks
  validates :name, presence: true
  validates :ticker, presence: true


  base_uri 'https://rest.coinapi.io'
  def self.new_lookup(ticker_symbol)
    headers = {
      'X-CoinAPI-Key' => '2198FA7A-F6EF-4A0D-9738-4FE9D396FEAF'
    }

    # Fetch the stock price
    response = get("/v1/exchangerate/#{ticker_symbol}/USD", headers: headers)

    if response.success?
      last_price = response.parsed_response['rate']
    else
      Rails.logger.error("Failed to fetch price for #{ticker_symbol}: #{response.body}")
      last_price = nil
    end
    # Create and return a new Stock instance
    new(
      ticker: ticker_symbol,
      name: ticker_symbol.upcase,
      last_price: last_price
    )
  rescue StandardError => e
    Rails.logger.error("Error fetching stock details: #{e.message}")
    nil
  end
end
