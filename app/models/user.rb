# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 50 }

  # Віртуальний атрибут для входу
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    # Отримуємо значення з параметра login (якщо він є)
    if login = conditions.delete(:login)
      where(conditions.to_h).where([
        "lower(email) = :value OR lower(nickname) = :value",
        { value: login.downcase }
      ]).first
    elsif conditions.has_key?(:email) || conditions.has_key?(:nickname)
      where(conditions.to_h).first
    end
  end
end
