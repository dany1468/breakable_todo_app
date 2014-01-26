class Task < ActiveRecord::Base
  APPLOACHING_DEADLINE_DAYS_INTERVAL = 1

  scope :approaching_deadline, -> { where('due_date <= ?', Time.zone.today.days_since(APPLOACHING_DEADLINE_DAYS_INTERVAL)) }
end
