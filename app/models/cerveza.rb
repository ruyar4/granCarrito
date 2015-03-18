class Cerveza < ActiveRecord::Base
	has_many :pedidos, dependent: :destroy
	has_many :users, through: :pedidos

	mount_uploader :photo, PhotoUploader

	include PgSearch
	pg_search_scope :search_name, :against => :name
  	#multisearchable :against => [:name]
end
