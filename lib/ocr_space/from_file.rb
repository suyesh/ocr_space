require 'ocr_space/file_post'
require 'fileutils'

module OcrSpace
  class FromFile
    attr_reader :data
      def initialize(apikey: ENV['ocr_api_key'], language: 'eng', isOverlayRequired: false, files: nil, ocr_space: "https://api.ocr.space/parse/image")
         @file = File.new(files)
         @data = OcrSpace::FilePost.post("/parse/image",
                                 body: { apikey: apikey,
                                         language: language,
                                         isOverlayRequired: isOverlayRequired,
                                         files: @file})
        @data = @data.data.parsed_response["ParsedResults"][0]
      end
      def text_data
        self.data.parsed_response["ParsedResults"][0]["ParsedText"]
      end
  end
end
