class Order < ApplicationRecord
	belongs_to :user, :class_name => "User", :foreign_key => "customer_id"
	has_many :products, :dependent => :destroy
end
