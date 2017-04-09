class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :email, uniqueness: { case_sensitive: false }
end