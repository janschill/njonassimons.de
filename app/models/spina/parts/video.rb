module Spina
  module Parts
    class Video < Base
      attr_json :video_id, :integer
      attr_json :video_url, :string, default: ""
      attr_json :video_platform_option, :string, default: ""
    end

    def content
      Video.find(video_id)
    end
  end
end
