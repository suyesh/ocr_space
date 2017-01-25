require 'ocr_space/file_post'

module OcrSpace
    module Convert
        def convert(apikey: @api_key, language: 'eng', isOverlayRequired: false, file: nil, url: nil, clean_result: false)
          if file
            @files = File.new(file)
            @data = OcrSpace::FilePost.post('/parse/image',
                                            body: { apikey: apikey,
                                                    language: language,
                                                    isOverlayRequired: isOverlayRequired,
                                                    file: @files })
            @data = @data.parsed_response['ParsedResults']
            clean_result == true ? @data[0]['ParsedText'].delete("\n").delete("\r").strip : @data = @data.parsed_response['ParsedResults']
          elsif url
            @data = HTTParty.post('https://api.ocr.space/parse/image',
                                  body: { apikey: apikey,
                                          language: language,
                                          isOverlayRequired: isOverlayRequired,
                                          url: url })
            @data = @data.parsed_response['ParsedResults']
            clean_result == true ? @data[0]['ParsedText'].delete("\n").delete("\r").strip : @data = @data.parsed_response['ParsedResults']
          else
            "You need to Pass either file or url."
          end
        end
    end
end
