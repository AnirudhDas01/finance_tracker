class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])

      respond_to do |format|
        if @stock
          format.html { render 'users/my_portfolio', status: :ok }
          format.js   { render partial: 'users/result' , status: :ok}
        else
          flash[:alert] = "Invalid Search - Stock not found."
          format.html { redirect_to my_portfolio_path, alert: flash[:alert] }
          format.js   { render js: "alert('#{flash[:alert]}');" }
        end
      end
    else
      flash[:alert] = "The search cannot be empty."
      respond_to do |format|
        format.html { redirect_to my_portfolio_path, alert: flash[:alert] }
        format.js   { render js: "alert('#{flash[:alert]}');" }
      end
    end
  end
end
