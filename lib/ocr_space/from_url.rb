require 'httparty'

module OcrSpace
    class FromUrl
        attr_reader :data
        def initialize(apikey: ENV['ocr_api_key'], language: 'eng', isOverlayRequired: false, url: nil, ocr_space: 'https://api.ocr.space/parse/image')
            @data = HTTParty.post('https://api.ocr.space/parse/image',
                                  body: { apikey: apikey,
                                          language: language,
                                          isOverlayRequired: isOverlayRequired,
                                          url: url })
            @data = @data.parsed_response['ParsedResults']
        end

        def text_data
            data[0]['ParsedText'].gsub(/(\\r|\\n)/, "")
        end
    end
end
