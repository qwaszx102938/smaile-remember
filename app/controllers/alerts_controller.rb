class AlertsController < ApplicationController
  def index
    @alert_items=AlertItem.where("user_id=? and alert_time<?",current_user,Time.now).order(:alert_time)
  end

  def take

    alert_item=AlertItem.find(params[:alert_id])
    MemoryService.had_remembered alert_item
    redirect_to alerts_path
    #render text:alert_item.remember_item.to_json

  end

  def miss
    alert_item=AlertItem.find(params[:alert_id])
    MemoryService.miss_alert_item alert_item
    redirect_to alerts_path
  end

end
