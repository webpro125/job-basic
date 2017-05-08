class ProjectApply < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :description, length: {in: 10..1000}
end
