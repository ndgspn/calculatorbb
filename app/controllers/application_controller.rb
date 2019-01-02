class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

    def bmi_service
      BmiService.new(params)
    end
    
    def broca_service 
      BrocaService.new(params)
    end

    def kalori_service
      KaloriService.new(params)
    end
end
