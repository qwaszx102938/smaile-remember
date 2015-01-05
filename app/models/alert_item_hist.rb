class AlertItemHist < ActiveRecord::Base
  belongs_to :remember_item
  belongs_to :user
end
