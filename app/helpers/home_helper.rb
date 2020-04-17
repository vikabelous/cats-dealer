module HomeHelper
  def random_landing_image_tag
    image_tag("landing-#{rand(1..5)}.svg")
  end

  def cats_types_select_tag
    select_tag(
      'type',
      options_for_select(t(:cats_types)),
      include_blank: "I don't care",
      class: 'form-control'
    )
  end

  def locations_select_tag
    select_tag(
      'location',
      options_for_select(t(:locations)),
      include_blank: "I don't care",
      class: 'form-control'
    )
  end
end
