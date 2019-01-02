class BrocaService
  attr_reader :tinggi, :gender

  def initialize(params)
    @tinggi     = params[:tinggi].to_f
    @gender     = params[:gender]
  end

  def call
    return result_pria if gender == 'pria'
    result_wanita
  end

  def result_pria
    ((tinggi - 100) - ((tinggi - 100) * 0.1)).ceil
  end

  def result_wanita
    ((tinggi - 100) - ((tinggi - 100) * 0.15)).ceil
  end
end
