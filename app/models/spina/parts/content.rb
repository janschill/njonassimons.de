module Spina
  module Parts
    class Content < Base
      attr_json :content_id, :integer
      attr_json :content_type, :string, default: ""
      # attr_json :image, Image.to_type, default: nil
      # attr_json :video, Video.to_type, default: nil

      # custom: parts/video
      attr_json :video_url, :string, default: ""
      attr_json :video_platform_option, :string, default: ""
      # === spina: parts/image ===
      attr_json :image_id, :integer, default: nil
      attr_json :signed_blob_id, :string, default: nil
      attr_json :alt, :string, default: ""
      attr_json :filename, :string, default: ""

      attr_accessor :options

      def to_s
        alt.presence || filename.presence || Spina::Image.model_name.human
      end

      def content
        self
      end

      def svg?
        filename =~ /\.svg\z/
      end

      def spina_image
        Spina::Image.find_by(id: image_id)
      end

      def present?
        signed_blob_id.present?
      end

      def signed_id(expires_in: nil)
        signed_blob_id
      end

      def variant(options)
        Spina::Parts::ImageVariant.new(self, options)
      end
      # === spina: parts/image ===
    end
  end
end
