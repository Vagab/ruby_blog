class User < ApplicationRecord
  has_many :articles
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    base: 1,
    admin: 5
  }

end
