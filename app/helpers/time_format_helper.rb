module TimeFormatHelper
  def time_format(time)
    time.strftime("%d-%m-%Y %H:%M:%S")
    l created_at, format: 'long'
  end
end