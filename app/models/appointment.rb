class Appointment < ActiveRecord::Base
  before_save :duration


  validates :first_name, :last_name, :start_date,    presence: true
  validates :start_time,    presence: true,
            uniqueness: { scope: :start_date }
  validate :expiration_date_cannot_be_in_the_past


  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      Appointment.create! row.to_hash
    end
  end


  def expiration_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") if
        Date.strptime(self.start_date, '%m/%d/%Y') < Date.today
  end


  def duration
    if self.end_time.present?
  ((self.end_time.gsub(':', '.').to_f - self.start_time.gsub(':', '.').to_f) *100).round(0)
    end
  end



end
