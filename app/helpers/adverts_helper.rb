module AdvertsHelper
  def post_date(date)
    # formatting date: Aug, 31 2007 - 9:55PM
    date.strftime("%b, %d %H:%M")
  end

  def resume(text)
    # text[0..300] + "..."
    truncate(text, length: 30)
  end
end