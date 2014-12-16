# http://fanyi.youdao.com/openapi.do?keyfrom=smiletalking&key=956262318&type=data&doctype=json&version=1.1&q=good
class TranslationsController < ApplicationController
  def new

  end

  def create

    t_response=HTTParty.get 'http://fanyi.youdao.com/openapi.do',
                 {query: {keyfrom: 'smiletalking', key: '956262318', type: 'data',
                          doctype: 'json', version: '1.1',
                          q: params[:translation][:trans]}
                 }
    t_response
    render text: t_response.to_s
  end


end

