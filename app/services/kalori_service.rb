class KaloriService
  attr_reader :gender, :berat_badan, :tinggi, :usia, :tingkat_aktivitas

  def initialize(params)
    @gender             = params[:gender]
    @berat_badan        = params[:berat_badan].to_f
    @tinggi             = params[:tinggi].to_f
    @usia               = params[:usia].to_i
    @tingkat_aktivitas  = params[:tingkat_aktivitas]
  end

  def call
    return bmr_pria if gender == 'pria'
    bmr_wanita
  end

  def bmr_pria
    66.4730 + (13.7516 * berat_badan) + (5.0033 * tinggi) - (6.7550 * usia)
  end

  def bmr_wanita
    655.0955 + (9.5634 * berat_badan) + (1.8496 * tinggi) - (4.6756 * usia)
  end

  def akg(bmr)
    case tingkat_aktivitas
    when 'pasif'
      akg_pasif(bmr)
    when 'ringan'
      akg_ringan(bmr)
    when 'sedang'
      akg_sedang(bmr)
    when 'berat'
      akg_berat(bmr)
    else
      akg_sangat_berat(bmr)
    end
  end

  def akg_pasif(bmr)
    (bmr * 1.2).ceil
  end

  def akg_ringan(bmr)
    (bmr * 1.375).ceil
  end

  def akg_sedang(bmr)
    (bmr * 1.55).ceil
  end

  def akg_berat(bmr)
    (bmr * 1.725).ceil
  end

  def akg_sangat_berat(bmr)
    (bmr * 1.9).ceil
  end

end
