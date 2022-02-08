module VideoHelper
  def video_from_page(page)
    page.json_attributes["en_content"].select{|part| part.attributes["name"].eql?("video")}.first
  end
end
