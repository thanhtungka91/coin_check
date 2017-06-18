require 'ruby_coincheck_client'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home 
    cc = CoincheckClient.new(ENV["API_KEY"], ENV["API_SECRET"])
    response = cc.read_orders
    result = JSON.parse(response.body)
    @orders = result["orders"]
    render html: @orders
  end 

  def cancel_order
    cc = "test"
  end
end
