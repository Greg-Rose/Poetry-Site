class Poem < ApplicationRecord
  include RailsSortable::Model
  set_sortable :sort, silence_recording_timestamps: true
  
  validates :title, presence: true
  validates :body, presence: true
end
