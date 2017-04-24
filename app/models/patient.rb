  class Patient < ApplicationRecord
	belongs_to :user
	belongs_to :hospital
	has_many :visits
end
