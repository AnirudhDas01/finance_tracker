require 'alphavantage'

Alphavantage.configure do |config|
  config.api_key = 'IT4Q0K2OG0UUQVD1'

  quote = Alphavantage::TimeSeries.new(symbol: 'TSLA').quote
  puts quote

end
