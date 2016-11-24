class Apartment < ApplicationRecord
  # Direct associations

  has_many   :leases,
             :dependent => :destroy

  has_many   :dates,
             :class_name => "Event",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
