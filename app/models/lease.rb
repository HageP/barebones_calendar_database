class Lease < ApplicationRecord
  # Direct associations

  has_many   :dates,
             :class_name => "Event",
             :dependent => :destroy

  belongs_to :tenant

  belongs_to :apartment

  # Indirect associations

  # Validations

end
