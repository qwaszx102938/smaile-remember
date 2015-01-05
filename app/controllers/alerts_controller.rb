class AlertsController < ApplicationController
  def index
    @alert_items=AlertItem.where("user_id=? and alert_time<?",current_user,Time.now).order(:alert_time)
  end

  def take


  end

  def miss

  end

end
