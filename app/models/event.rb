class Event < ActiveRecord::Base

  attr_accessible :name, :starts_at, :ends_at, :subject_id, :event_duration_in_minutes

  belongs_to :subject
end
