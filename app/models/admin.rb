class Admin < ApplicationRecord
  include Nameable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, length: { in: 2..24 },
            format: { with: RegexConstants::Letters::AND_NUMBERS,
                      message: 'Special letters are not allowed to input' }
  validates :last_name, length: { in: 2..24 },
            format: { with: RegexConstants::Words::AND_SPECIAL,
                      message: 'Special letters are not allowed to input' }
  validates :zip_code, presence: true

  has_many :projects
end
