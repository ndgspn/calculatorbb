class CalcController < ApplicationController
  def bmi 
    @bmi                 = bmi_service.bmi
    @minimum_body_weight = bmi_service.minimum_body_weight
    @maximum_body_weight = bmi_service.maximum_body_weight
    @body_weight_status  = bmi_service.body_weight_status
    render :index
  end

  def broca 
    @broca                    = broca_service.broca
    @less_than_minimum_height = broca_service.less_than_minimum_height
    render :index
  end

  def calorie
    @bmr_calorie = calorie_service.bmr_calorie
    @akg         = calorie_service.akg
    render :index
  end

end
