class AlertsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:extension_take, :extension_miss, :extension_index]

  def index
    @alert_items=AlertItem.where("user_id=? and alert_time<?", current_user, Time.now).order(:alert_time)
  end

  def extension_index
    alert_items=AlertItem.where("user_id=? and alert_time<?", current_user, Time.now).order(:alert_time)
    extension_alert_items=[]
    if alert_items.size>0
      alert_items.each do |alert_item|
        extension_alert_items.append alert_item.to_extension_hash
      end
      render json:{message:{result:"有提醒"},extension_alert_items:extension_alert_items}
    else
      render json:{message:{result:"暂时没有提醒"}}
    end
  end


  def extension_take
    take_method
    render json: {message: {resule: '记忆成功'}}
  end

  def extension_miss
    miss_method
    render json: {message: {resule: '下次可要努力了'}}
  end


  def take
    take_method
    redirect_to alerts_path
    #render text:alert_item.remember_item.to_json

  end

  def miss
    miss_method
    redirect_to alerts_path
  end

  private

  def take_method
    alert_item=AlertItem.find(params[:alert_id])
    MemoryService.had_remembered alert_item
  end

  def miss_method
    alert_item=AlertItem.find(params[:alert_id])
    MemoryService.miss_alert_item alert_item
  end


end
