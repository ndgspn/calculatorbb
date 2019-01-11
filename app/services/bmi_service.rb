class BmiService
  attr_reader :body_weight, :body_height

  def initialize(params)
    @body_weight = params[:body_weight].to_f
    @body_height = params[:body_height].to_f
  end

  def bmi
    (body_weight / ((body_height / 100) ** 2)).round(1)
  end

  def body_weight_status
    case
    when bmi >= 30.0
      render_obesity
    when bmi >= 25.0
      render_overweight
    when bmi >= 18.5
      render_ideal
    else
      render_skiny
    end
  end

  def minimum_body_weight
    (18.5 * ((body_height / 100) ** 2)).round(1)
  end

  def maximum_body_weight
    (24.9 * ((body_height / 100) ** 2)).round(1)
  end

  def render_obesity
    '<font color="#ff3300">Kegemukan (Obesitas)</font>'
  end

  def render_overweight
    '<font color="#ff704d">Kelebihan berat badan</font>'
  end

  def render_ideal
    '<font color="#269900">Normal (Ideal)</font>'
  end

  def render_skiny
    '<font color="#000000">Kurus</font>'
  end
end
