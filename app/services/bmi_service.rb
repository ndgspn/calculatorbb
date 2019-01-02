class BmiService
  attr_reader :berat_badan, :tinggi

  def initialize(params)
    @berat_badan        =  params[:berat_badan].to_f
    @tinggi             =  params[:tinggi].to_f
  end

  def call
    bmi         = (berat_badan / ((tinggi / 100) ** 2)).round(1)
  end

  def status_bb(bmi)
    case
    when bmi >= 30.0
      render_obesitas
    when bmi >= 25.0
      render_kelebihan_berat
    when bmi >= 18.5
      render_ideal
    else
      render_kurus
    end
  end

  def min_weight
    berat_min   = (18.5 * ((tinggi / 100) ** 2)).round(1)
  end

  def max_weight
    berat_max   = (24.9 * ((tinggi / 100) ** 2)).round(1)
  end

  def render_obesitas
    '<font color="#ff3300">Kegemukan (Obesitas)</font>'
  end

  def render_kelebihan_berat
    '<font color="#ff704d">Kelebihan berat badan</font>'
  end

  def render_ideal
    '<font color="#269900">Normal (Ideal)</font>'
  end

  def render_kurus
    '<font color="#000000">Kurus</font>'
  end
end
