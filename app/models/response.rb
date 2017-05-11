class Response < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :ratings,
             :dependent => :destroy

  belongs_to :vignette

  # Indirect associations

  # Validations

end
