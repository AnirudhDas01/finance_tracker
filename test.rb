require 'alphavantage'
API_KEY = 'VWLHTWW64V97I9VE'

Alphavantage.configure do |config|
  config.api_key = API_KEY
end

stock_timeseries = Alphavantage::TimeSeries.new(symbol: 'TSLA')

stock_detail = Alphavantage::TimeSeries.new(symbol: 'GOOG').quote

puts stock_detail.price
