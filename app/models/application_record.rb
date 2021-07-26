class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # auto_strip_attributes :genere
  # auto_strip_attributes :genere, squish: true
end
