class User < ApplicationRecord

  has_secure_password
  validates :username, uniqueness: {
    case_sensitive: false
  }


  has_many :user_portfolios
  has_many :portfolios, through: :user_portfolios

end
