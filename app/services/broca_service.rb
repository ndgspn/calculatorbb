class BrocaService
  attr_reader :body_height, :gender

  def initialize(params)
    @body_height = params[:body_height].to_f
    @gender      = params[:gender]
  end

  def broca
    return man_broca if gender == 'pria'
    woman_broca
  end

  def man_broca
    ((body_height - 100) - ((body_height - 100) * 0.1)).ceil
  end

  def woman_broca
    ((body_height - 100) - ((body_height - 100) * 0.15)).ceil
  end

  def less_than_minimum_height
    body_height.to_i < 145
  end
end
