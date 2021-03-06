require 'bcrypt'

class NewAccount < ApplicationRecord
  belongs_to :user

  # this will read the password and access it
  attr_reader :password
  attr_accessor :password_confirmation

  # this will encrypt the password
  def password=(unencrypted_password)
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(unencrypted_password)
  end

    # this will validate email is present and unique
    validates :email, presence: true
    validates :password, presence: true, confirmation: true, :on => create
    validates :password_confirmation, presence: true, :on => create
end
