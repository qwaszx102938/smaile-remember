# http://fanyi.youdao.com/openapi.do?keyfrom=smiletalking&key=956262318&type=data&doctype=json&version=1.1&q=good
class TranslationsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :index]
  skip_before_filter :verify_authenticity_token, :only => :extension_create

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
    remember_item=RememberItem.find_by_user_id_and_remember_id current_user, remember
    unless remember_item
      remember_item=RememberItem.create(user: current_user, remember: remember)
    else
      remember_item.update updated_at: Time.now
    end
    MemoryService.get_remember remember_item
    @translation=Translation.new remember.remember_reference
    #alert_item=AlertItem.find_by_remember_item_id remember_item
    #render text: (alert_item.alert_time)
  end

  def extension_create
    trans_name=params[:trans].lstrip.rstrip
    if trans_name==""
      render json: {message: {resule: "查询字段不能为空"}}
    end
    remember=Remember.find_by remember_content: trans_name
    unless remember
      t_response=remote_trans trans_name
      reference=t_response.parsed_response
      remember=Remember.create(remember_content: trans_name,
                               remember_reference: reference.to_json)
    end
    remember_item=RememberItem.find_by_user_id_and_remember_id current_user, remember
    unless remember_item
      remember_item=RememberItem.create(user: current_user, remember: remember)
    else
      remember_item.update updated_at: Time.now
    end
    MemoryService.get_remember remember_item
    translation= （ Translation.new remember.remember_reference).to_json
    render json: translation
    #render text: (alert_item.alert_time)
  end


  #所有查过的记录
  def index
    @remember_items=RememberItem.order("updated_at desc").where(user_id: current_user.id)
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

