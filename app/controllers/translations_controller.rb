# http://fanyi.youdao.com/openapi.do?keyfrom=smiletalking&key=956262318&type=data&doctype=json&version=1.1&q=good
class TranslationsController < ApplicationController
  def new
    @translation=Translation.new
  end

  def create
    trans_name=params[:translation][:trans].lstrip.rstrip
    if trans_name==""
      render "create"
    end
    remember=Remember.find_by remember_content: trans_name
    unless remember
      t_response=remote_trans trans_name
      reference=t_response.parsed_response
      remember=Remember.create(remember_content: trans_name,
                               remember_reference: reference.to_json)
    end
    @translation=Translation.new remember.remember_reference
    #render text: @translation.trans_explains
  end

  private

  def remote_trans t_r
    t_response=HTTParty.get 'http://fanyi.youdao.com/openapi.do',
                            {query: {keyfrom: 'smiletalking', key: '956262318', type: 'data',
                                     doctype: 'json', version: '1.1',
                                     q: t_r}
                            }

  end

end

