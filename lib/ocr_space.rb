require "ocr_space/version"
require "ocr_space/from_url"
require "ocr_space/from_file"

module OcrSpace
  def text_data(result)
    result.data.parsed_response["ParsedResults"][0]["ParsedText"]
  end
end
