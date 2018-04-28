module DatetimeHelper
  def datetime(datetime)
    datetime&.strftime('%F %H:%M:%S')
  end
end
