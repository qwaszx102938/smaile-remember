=begin
  第一个记忆周期是 5分钟 　　
  第二个记忆周期是30分钟 　　
  第三个记忆周期是12小时
  这三个记忆周期属于短期记忆的范畴。 　　
  下面是几个比较重要的周期。 　　
  第四个记忆周期是 1天 　　
  第五个记忆周期是 2天 　　
  第六个记忆周期是 4天 　　
  第七个记忆周期是 7天 　　
  第八个记忆周期是15天
=end
class MemoryService
  #下一级间隔时间（秒）

  @@alert_list=[
      #0-1
      5*60,
      #1-2
      25*60,
      #2-3
      11.5*60*60,
      #3-4
      12*60*60,
      #4-5
      24*60*60,
      #5-6
      2*24*60*60,
      #6-7
      3*24*60*60,
      #7-8
      8*24*60*60
      ]
  def had_remembered remember_item

  end

  def self.get_remember remember_item
    alert_item=AlertItem.find_by_remember_item_id remember_item
    unless alert_item
      AlertItem.create remember_item:remember_item,user_id:(remember_item.user_id),state:0,level:1,alert_time:(Time.now+@@alert_list[0])
    else
      AlertItemHist .create remember_item:remember_item,user_id:(remember_item.user_id),state:0,level:1,alert_time:(alert_item.alert_time)
      alert_item.delete
    end

  end

  def miss remember_item

  end

end