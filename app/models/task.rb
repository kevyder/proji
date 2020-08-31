class Task < ApplicationRecord
  belongs_to :project

  def completed?
    !self.completed_at.blank?
  end

end
