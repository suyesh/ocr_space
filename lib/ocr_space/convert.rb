require 'ocr_space/file_post'
module OcrSpace
    module Convert
        def convert(apikey: @api_key, language: 'eng', isOverlayRequired: false, file: nil, url: nil)
          if file
            @files = File.new(file)
            @data = OcrSpace::FilePost.post('/parse/image',
                                            body: { apikey: apikey,
                                                    language: language,
                                                    isOverlayRequired: isOverlayRequired,
                                                    file: @files })
            @data = @data.parsed_response['ParsedResults']
          elsif url
            @data = HTTParty.post('https://api.ocr.space/parse/image',
                                  body: { apikey: apikey,
                                          language: language,
                                          isOverlayRequired: isOverlayRequired,
                                          url: url })
            @data = @data.parsed_response['ParsedResults']
          else
            "You need to Pass either file or url."
          end
        end

        def clean_convert(apikey: @api_key, language: 'eng', isOverlayRequired: false, file: nil, url: nil)
          if file
            @files = File.new(file)
            @data = OcrSpace::FilePost.post('/parse/image',
                                            body: { apikey: apikey,
                                                    language: language,
                                                    isOverlayRequired: isOverlayRequired,
                                                    file: @files })
            @data = @data.parsed_response['ParsedResults'][0]["ParsedText"].gsub(/\r|\n/, "")
          elsif url
            @data = HTTParty.post('https://api.ocr.space/parse/image',
                                  body: { apikey: apikey,
                                          language: language,
                                          isOverlayRequired: isOverlayRequired,
                                          url: url })
            @data = @data.parsed_response['ParsedResults'][0]["ParsedText"].gsub(/\r|\n/, "")
          else
            "You need to Pass either file or url."
          end
        end
    end
end
