# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  name                 :string
#  username             :string
#  email                :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  remember_created_at  :datetime
#  encrypted_password   :string
#  reset_password_token :string
#  admin                :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # The User has_many events they can be the creator for; they are referenced by a creator_id
  has_many :events, :foreign_key => :creator_id
  # The User has_many event_attendees tables; in which they are referenced by the attendee_id
  has_many :event_attendees,  :foreign_key => :attendee_id
  # The User has_many attended_events; through the event_attendees list
  has_many :attended_events,  :through => :event_attendees, dependent: :delete_all

  # Return true if user is attending event
  def attending?(event)
	  event.attendees.include?(self)
	end

  # Create an entry in the event_attendees table for which the attended_event is the given event_id
  def attend!(event)
    self.event_attendees.create!(attended_event_id: event.id)
  end

  # Select the attended_event_id which matches the given event_id and destroy it with a method in event_attendees_controller
  def cancel!(event)
		self.event_attendees.find_by(attended_event_id: event.id).destroy
	end

  # Compares the creator_id of the event with the user's id; return true if they're the same (user is host)
  def host?(event)
    event.creator_id == self.id
  end

  # Validations
  validates :name, presence: true, length: { maximum: 20 }
  validates :username, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { maximum: 20 }
end
