require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  # Custom getter
  def password
    @password ||= Password.new(password_hash)
  end

  # Custom setter
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
