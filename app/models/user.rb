class User < ApplicationRecord
  acts_as_voter

  devise :database_authenticatable, :registerable, :recoverable 
  devise :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
  has_many :posts, dependent: :destroy

end
