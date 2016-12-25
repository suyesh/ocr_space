require 'httmultiparty'

module OcrSpace
    class FilePost
        include HTTMultiParty
        base_uri 'https://api.ocr.space'
    end
end
