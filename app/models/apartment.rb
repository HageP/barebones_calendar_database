class Apartment < ApplicationRecord
  # Direct associations

  has_many   :dates,
             :class_name => "Event",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
