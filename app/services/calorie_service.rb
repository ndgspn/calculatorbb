class CalorieService
  attr_reader :gender, :body_weight, :body_height, :age, :activity_level

  def initialize(params)
    @gender         = params[:gender]
    @body_weight    = params[:body_weight].to_f
    @body_height    = params[:body_height].to_f
    @age            = params[:age].to_i
    @activity_level = params[:activity_level]
  end

  def bmr_calorie
    return man_bmr if gender == 'pria'
    woman_bmr
  end

  def man_bmr
    66.4730 + (13.7516 * body_weight) + (5.0033 * body_height) - (6.7550 * age)
  end

  def woman_bmr
    655.0955 + (9.5634 * body_weight) + (1.8496 * body_height) - (4.6756 * age)
  end

  def akg
    case activity_level
    when 'passive'
      akg_passive(bmr_calorie)
    when 'light'
      akg_light(bmr_calorie)
    when 'medium'
      akg_medium(bmr_calorie)
    when 'heavy'
      akg_heavy(bmr_calorie)
    else
      akg_very_heavy(bmr_calorie)
    end
  end

  def akg_passive(bmr_calorie)
    (bmr_calorie * 1.2).ceil
  end

  def akg_light(bmr_calorie)
    (bmr_calorie * 1.375).ceil
  end

  def akg_medium(bmr_calorie)
    (bmr_calorie * 1.55).ceil
  end

  def akg_heavy(bmr_calorie)
    (bmr_calorie * 1.725).ceil
  end

  def akg_very_heavy(bmr_calorie)
    (bmr_calorie * 1.9).ceil
  end

end
