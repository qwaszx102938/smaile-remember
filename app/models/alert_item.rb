class AlertItem < ActiveRecord::Base
  belongs_to :remember_item
  belongs_to :user

  #设计转为extension json的hash
  def to_extension_hash

    trans_array=[]
    explain_array[]
    self.remember_item.remember.to_translation.trans_explains.each do |explain|
      explain_array.append explain
    end

    self.remember_item.remember.to_translation.trans_translation.each do |translation|
      trans_array.append translation
    end
    {alert_item_id: self.id,
     trans_name:self.remember_item.remember.to_translation.trans_name,
     trans:trans_array,
     explain:trans_array
    }
  end
end
