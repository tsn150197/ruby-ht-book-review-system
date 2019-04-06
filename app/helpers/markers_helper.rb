module MarkersHelper
  def marker_form book_id, status, user = User.new
    if @marker = user.markers.find_by(book_id: book_id, status: status)
      render "markers/form/cancel_#{@marker.status}", object: @marker
    else
      render "markers/form/#{status}"
    end
  end

  def i18n_status_marker marker = Marker.new
    Marker.human_enum_name(:status, :"#{marker.status}")
  end

  def check_favorite? book_id, user = User.new
    return true if user.markers.find_by(book_id: book_id, status: :favorite)
  end
end
