require 'ruby_coincheck_client'
class CoinChecksController < ApplicationController
  before_action :set_coin_check, only: [:show, :edit, :update, :destroy]
  $api_key =  ENV["API_KEY"]
  $api_secret = ENV["API_SECRET"]

  # initial request to coincheck server 
  def initialize
    @cc = CoincheckClient.new($api_key, $api_secret)
  end 

  #home 
  def home 
    # render html: "test"
  end 

  # GET /coin_checks
  # GET /coin_checks.json
  def index
    # cc = CoincheckClient.new($api_key, $api_secret)
    response = @cc.read_orders
    result = JSON.parse(response.body)
    @orders = result["orders"]
    # @coin_checks = CoinCheck.all
  end

  def history
    response = @cc.read_transactions
    result = JSON.parse(response.body)
    @transactions = result["transactions"]
    # render html: @transactions
  end 
  # GET /coin_checks/1
  # GET /coin_checks/1.json
  def show
  end

  # GET /coin_checks/new
  def new
    @coin_check = CoinCheck.new
  end

  # GET /coin_checks/1/edit
  def edit
  end

  # POST /coin_checks
  # POST /coin_checks.json
  def create
    @coin_check = CoinCheck.new(coin_check_params)

    respond_to do |format|
      if @coin_check.save
        format.html { redirect_to @coin_check, notice: 'Coin check was successfully created.' }
        format.json { render :show, status: :created, location: @coin_check }
      else
        format.html { render :new }
        format.json { render json: @coin_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coin_checks/1
  # PATCH/PUT /coin_checks/1.json
  def update
    respond_to do |format|
      if @coin_check.update(coin_check_params)
        format.html { redirect_to @coin_check, notice: 'Coin check was successfully updated.' }
        format.json { render :show, status: :ok, location: @coin_check }
      else
        format.html { render :edit }
        format.json { render json: @coin_check.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coin_checks/1
  # DELETE /coin_checks/1.json
  def destroy
    @coin_check.destroy
    respond_to do |format|
      format.html { redirect_to coin_checks_url, notice: 'Coin check was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin_check
      @coin_check = CoinCheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coin_check_params
      params.fetch(:coin_check, {})
    end
end
