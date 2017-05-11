class Rating < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  belongs_to :response

  # Indirect associations

  # Validations

end
