module VideoHelper
  def video_from_page(page)
    page.json_attributes["en_content"].find { |part| part.attributes["name"].eql?("video") }
  end
end
