class PortfoliosWarpController < ApplicationWarpController

  def index(params)
    Portfolio.after_create do
      yield Portfolio.all
    end

    Portfolio.after_update do
      yield Portfolio.all
    end

    Portfolio.after_destroy do
      yield Portfolio.all
    end

    yield Portfolio.all

  end

  def show(params)
    portfolio = Portfolio.find(params[:id])

    yield portfolio, include: [:documents]
  end

  def create(params)
    user = User.find(current_user.id)
    portfolio = Portfolio.create(name: params["portfolio"]["name"])
    user.portfolios << portfolio

    yield portfolio
  end

  def destroy(params)
    yield Portfolio.destroy(params[:id])
  end


  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :id)

  end
end