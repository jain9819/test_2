class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, :dependent => :destroy, :foreign_key => "customer_id"
  has_many :orders, :depedent => :destory, :foreign_key => "customer_id" 

  def get_name
    first_name + " " + last_name
  end

  def self.get_name(user)
    user.first_name + " " + user.last_name
  end
end
