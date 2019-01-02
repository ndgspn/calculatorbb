class CalcController < ApplicationController
  def bmi 
    @bmi        = bmi_service.call
    @berat_min  = bmi_service.min_weight
    @berat_max  = bmi_service.max_weight
    @status_bb  = bmi_service.status_bb(@bmi)
    render :index
  end

  def broca 
    @result     = broca_service.call
    render :index
  end

  def kalori
    @bmr        = kalori_service.call
    @akg        = kalori_service.akg(@bmr)
    render :index
  end

end
