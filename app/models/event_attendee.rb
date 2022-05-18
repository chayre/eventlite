# == Schema Information
#
# Table name: event_attendees
#
#  id                :integer          not null, primary key
#  attendee_id       :integer
#  attended_event_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
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
