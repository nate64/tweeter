class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_one :bio
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         password_length: 8..128
  
  #validate :password_complexity
  
    # def password_complexity
    #   return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    #    errors.add :password, 'Complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    # end

end
