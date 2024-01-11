module TimeFormatHelper
  def time_format(time)
    time.strftime("%d-%m-%Y %H:%M:%S")
  end
end