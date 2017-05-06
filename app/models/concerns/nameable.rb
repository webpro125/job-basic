module Nameable
  extend ActiveSupport::Concern

  def full_name
    "#{first_name} #{last_name}".split.map(&:capitalize).join(' ')
  end
end
