class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def bmi_service
    BmiService.new(params)
  end
  
  def broca_service 
    BrocaService.new(params)
  end

  def calorie_service
    CalorieService.new(params)
  end

end
