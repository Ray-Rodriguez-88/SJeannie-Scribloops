class CreatePortfolioDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_documents do |t|
      t.belongs_to :portfolio, foreign_key: true
      t.belongs_to :document, foreign_key: true

      t.timestamps
    end
  end
end
