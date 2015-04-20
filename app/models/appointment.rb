class Appointment < ActiveRecord::Base

  before_save :duration


  'require csv'

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      Appointment.create! row.to_hash
    end
  end

  validates :start_date,    presence: true
  validates :start_time,    presence: true,
            uniqueness: { scope: :start_date }

  def duration
    if self.end_time.present?
  ((self.end_time.gsub(':', '.').to_f - self.start_time.gsub(':', '.').to_f) *100).round(0)
    end
  end


end
