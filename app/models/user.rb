class User < ApplicationRecord
  # Direct associations

  has_many   :ratings,
             :dependent => :destroy

  has_many   :responses,
             :dependent => :destroy

  # Indirect associations

  has_many   :rated_vignettes,
             :through => :rated_responses,
             :source => :vignette

  has_many   :rated_responses,
             :through => :ratings,
             :source => :response

  has_many   :vignettes,
             :through => :responses,
             :source => :vignette

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
