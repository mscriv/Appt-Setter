class AppointmentImport < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      AppointmentImport.create! row.to_hash
    end
  end

  def duration
    if self.end_time.present?
      ((self.end_time.gsub(':', '.').to_f - self.start_time.gsub(':', '.').to_f) *100).round(0)
    end
  end
end
