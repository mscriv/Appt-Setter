class Appointment < ActiveRecord::Base

  require 'csv'
  validates :first_name, :last_name, :start_date,    presence: true
  validates :start_time,    presence: true,
            uniqueness: { scope: :start_date }

  validate :start_date_cannot_be_in_the_past


  def start_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
        end_date.blank? and Date.strptime(self.start_date, '%m/%d/%Y') < Date.today
  end


end
