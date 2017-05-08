class Project < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :admin

  validates :title, length: { in: 2..128 },
            format: { with: RegexConstants::Letters::AND_NUMBERS,
                      message: 'Special letters are not allowed to input' }
  validates :company_name, presence: true
  validates :category, presence: true
  validates :description, length: {in: 10..1000}

end
