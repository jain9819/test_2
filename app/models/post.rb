class Post < ApplicationRecord
	belongs_to :user, :class_name => "User", :foreign_key => "customer_id"
	has_many :comments, :dependent => :destroy
	has_many :likes, as: :likeable
end
