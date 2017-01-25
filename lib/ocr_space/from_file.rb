require 'ocr_space/file_post'

module OcrSpace
    class File
        attr_reader :data
        def initialize(apikey: ENV['ocr_api_key'], language: 'eng', isOverlayRequired: false, file: nil)
            @files = File.new(file)
            @data = OcrSpace::FilePost.post('/parse/image',
                                            body: { apikey: apikey,
                                                    language: language,
                                                    isOverlayRequired: isOverlayRequired,
                                                    file: @files })
            @data = @data.parsed_response['ParsedResults']
        end

        def text_data
            data[0]['ParsedText'].delete("\n").delete("\r").strip
        end
    end
end
