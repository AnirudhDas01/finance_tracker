# class StocksController < ApplicationController
#   def search
#     if params[:stock].present?
#       @stock = Stock.new_lookup(params[:stock])

#       respond_to do |format|
#         if @stock
#           
#           format.js   { render partial: 'users/search' , status: :ok}
#         else
#           flash[:alert] = "Invalid Search - Stock not found."
#           format.html { redirect_to my_portfolio_path, alert: flash[:alert] }
#           format.js   { render js: "alert('#{flash[:alert]}');" }
#         end
#       end
#     else
#       flash[:alert] = "The search cannot be empty."
#       respond_to do |format|
#         format.html { redirect_to my_portfolio_path, alert: flash[:alert] }
#         format.js   { render js: "alert('#{flash[:alert]}');" }
#       end
#     end
#   end
# end

class StocksController <ApplicationController
    
  def search
      if params[:stock].present?            
           @stock = Stock.new_lookup(params[:stock])
           if @stock            
              respond_to do |format|
                format.html { render 'users/my_portfolio', status: :ok }
                  format.js { render partial: 'users/search' }
              end         
           else
              flash[:alert] = "Please enter a valid symbol to search"
              redirect_to my_portfolio_path
           end             
      else 
          flash[:alert] = "Please enter a symbol to search"
          redirect_to my_portfolio_path
      end
  end
  
end