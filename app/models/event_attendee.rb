class EventAttendee < ApplicationRecord
# Belongs to an attendee    
belongs_to :attendee, :class_name => "User"
# Belongs to an attended event
belongs_to :attended_event, :class_name => "Event"

# Has an attendee_id
validates :attendee_id, presence: true
# Has an attended_event_id
validates :attended_event_id, presence: true

end
