class Leader < ApplicationRecord
  has_one :group

  validates :first_name, :last_name, :email, :phone_number, presence: true
  validates_format_of :phone_number, with: /\A[0-9]{3}-[0-9]{3}-[0-9]{4}$/
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def full_name
    "#{first_name} #{last_name}"
  end

  def group_name
    group ? group.name : 'No Group for this Leader'
  end
end
