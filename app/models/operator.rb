class Operator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  validate :password_complexity

  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
      errors.add :password, 'La password non è sufficientemente complessa'
    end
  end

  has_many :requests
end
