class RememberItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :remember
end
