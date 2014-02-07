class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :invitable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :name, :email, :password, :password_confirmation, :confirmed_at, :remember_me

end
