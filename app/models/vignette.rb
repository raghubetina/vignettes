class Vignette < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :dependent => :destroy

  # Indirect associations

  has_many   :raters,
             :through => :responses,
             :source => :raters

  has_many   :users,
             :through => :responses,
             :source => :user

  # Validations

end
