#解析remember.remember_reference
class Translation

#trans_translation  翻译结果 数组
#trans_explains    翻译解析  数组

  attr_accessor :trans_name, :trans_translation, :trans_explains

  def initialize data_string=nil
    if data_string
      begin
        data_hash=JSON.parse data_string
        @trans_name=data_hash["query"]
        @trans_translation=data_hash["translation"]
        @trans_explains=data_hash["basic"]["explains"]
      rescue
        1
      end
    end
    super()
  end

  def method_missing
    nil
  end
end
