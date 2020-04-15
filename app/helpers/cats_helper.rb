module CatsHelper
  def rescue_broken_image(url)
    image_tag(url, onerror: "this.src='#{image_path('default_cat')}'")
  end
end
