require "ocr_space/version"
require 'httparty'
require 'httmultiparty'
require 'fileutils'

module OcrSpace
  class FromUrl
  attr_reader :data
    def initialize(apikey: ENV['ocr_api_key'], language: 'eng', isOverlayRequired: false, url: nil, ocr_space: "https://api.ocr.space/parse/image")
       @data = HTTParty.post("https://api.ocr.space/parse/image",
                               body: { apikey: apikey,
                                       language: language,
                                       isOverlayRequired: isOverlayRequired,
                                       url: url})
    end
  end

  class FilePost
    include HTTMultiParty
    base_uri 'https://api.ocr.space'
  end

  class FromFile
    attr_reader :data
      def initialize(apikey: ENV['ocr_api_key'], language: 'eng', isOverlayRequired: false, files: nil, ocr_space: "https://api.ocr.space/parse/image")
         @file = File.new(files)
         @data = FilePost.post("/parse/image",
                                 body: { apikey: apikey,
                                         language: language,
                                         isOverlayRequired: isOverlayRequired,
                                         files: @file})
      end
  end
end
