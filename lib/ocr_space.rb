require "ocr_space/version"
require "ocr_space/from_url"
require "ocr_space/from_file"

module OcrSpace
  class << self
    def text_data
      self.data.parsed_response["ParsedResults"][0]["ParsedText"]
    end
  end
end
