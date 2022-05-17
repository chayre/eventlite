class Event < ApplicationRecord
    #has_many :post_authorings, foreign_key: :authored_post_id
    #has_many :authors, through: :post_authorings, source: :post_author

    # The Event belongs to a creator which is of class User
    belongs_to 	:creator, :class_name => "User"
    # The Event has many attendees through which it related in event_attendees table
    has_many :attendees, :through => :event_attendees
    # The Event has many event_attendees lists, each event that is attended has an id
    has_many :event_attendees,  :foreign_key => :attended_event_id
end
