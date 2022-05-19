# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  location    :string
#  description :text
#  title       :string
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
# Indexes
#
#  index_events_on_creator_id  (creator_id)
#
class Event < ApplicationRecord
    #has_many :post_authorings, foreign_key: :authored_post_id
    #has_many :authors, through: :post_authorings, source: :post_author

    # The Event belongs to a creator which is of class User
    belongs_to 	:creator, :class_name => "User"
    # The Event has many event_attendees lists, each event that is attended has an id
    has_many :event_attendees,  :foreign_key => :attended_event_id
    # The Event has many attendees through which it related in event_attendees table
    has_many :attendees, :through => :event_attendees, dependent: :delete_all

    # Allows you to call event.past for a boolean return if the event is in the past
    scope :past, 	 -> { where("Date <  ?", Date.today).order('Date DESC') }
    # Allows you to call event.future for a boolean return if the event is in the future
    scope :future, 	 -> { where("Date >  ?", Date.today).order('Date DESC') }

end
