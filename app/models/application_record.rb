# Main class of active record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
