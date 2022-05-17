class Event < ApplicationRecord
    #has_many :post_authorings, foreign_key: :authored_post_id
    #has_many :authors, through: :post_authorings, source: :post_author
    belongs_to 	:creator, :class_name => "User"
    #belongs_to :creator, class_name: "User"
end
