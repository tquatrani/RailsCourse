class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :memberships
	has_many :categories, through: :memberships

	validates :title, :description, :url, presence: true
end