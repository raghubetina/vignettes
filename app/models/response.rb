class Response < ApplicationRecord
  # Direct associations

  has_many   :ratings,
             :dependent => :destroy

  belongs_to :vignette

  # Indirect associations

  # Validations

end
