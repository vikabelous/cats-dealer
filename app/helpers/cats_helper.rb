module CatsHelper
  def rescue_broken_image_tag(url)
    image_tag(url, onerror: "this.src='#{image_path('default_cat')}'")
  end

  def cats_types_select_tag(selected_value)
    select_tag(
      'type',
      options_for_select(t(:cats_types), selected_value),
      include_blank: '-- Any --',
      class: 'form-control'
    )
  end

  def locations_select_tag(selected_value)
    select_tag(
      'location',
      options_for_select(t(:locations), selected_value),
      include_blank: '-- Any --',
      class: 'form-control'
    )
  end
end
