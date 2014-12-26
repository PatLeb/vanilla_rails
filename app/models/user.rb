class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w{admin guest}

  # devise/lib/devise/parameter_sanitizer.rb, line 88 : need to add 'role' for strong parameters
end
