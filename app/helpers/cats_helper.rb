module CatsHelper
  def rescue_broken_image_tag(url)
    image_tag(url, onerror: "this.src='#{image_path('no-image')}'")
  end

  def search_results_title(search_params)
    type = search_params[:type].presence || 'All'
    location = search_params[:location].presence || 'Everywhere'

    "#{type} cats from #{location}"
  end
end
