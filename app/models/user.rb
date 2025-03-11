class User < ApplicationRecord
  # Devise modules and JWT setup
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  # Association with visits
  has_many :visits, dependent: :destroy
  has_many :gardens, through: :visits
end
