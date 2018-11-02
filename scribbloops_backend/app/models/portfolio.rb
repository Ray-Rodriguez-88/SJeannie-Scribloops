class Portfolio < ApplicationRecord
  has_many :user_portfolios, dependent: :destroy
  has_many :uploads, dependent: :destroy
  has_many :documents, dependent: :destroy
  #, before_remove: [:destroy_documents]

  # def destroy_documents(params)
  #   delete_these = Document.where(portfolio_id: params[:portfolio_id])
  #   delete_these.destroy
  # end

end
