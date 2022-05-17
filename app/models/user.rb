class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # The User has_many events they can be the creator for; they are referenced by a creator_id
  has_many :events, :foreign_key => :creator_id
  # The User has_many attended_events; through the event_attendees list
  has_many :attended_events,  :through => :event_attendees
  # The User has_many event_attendees tables; in which they are referenced by the attendee_id
  has_many :event_attendees,  :foreign_key => :attendee_id

end
