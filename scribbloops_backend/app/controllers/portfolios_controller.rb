class PortfoliosController < ApplicationController
  before_action :authorized

  def index
    render json: []
  end

  def show
    portfolio = Portfolio.find(params[:id])

    render json: portfolio, include: [:documents]
  end

  def create
    user = User.find(current_user.id)
    portfolio = Portfolio.create(name: params["portfolio"]["name"])
    user.portfolios << portfolio

    render json: portfolio
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name, :id)

  end

end