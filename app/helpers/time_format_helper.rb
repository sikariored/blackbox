module TimeFormatHelper
  def time_format(time)
    l time, format: :long
  end
end