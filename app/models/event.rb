class Event < ApplicationRecord
  # Direct associations

  belongs_to :lease

  belongs_to :status

  belongs_to :tenant

  belongs_to :apartment

  # Indirect associations

  # Validations

end
