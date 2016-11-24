class Event < ApplicationRecord
  # Direct associations

  belongs_to :status

  belongs_to :tenant

  belongs_to :apartment

  # Indirect associations

  # Validations

end
