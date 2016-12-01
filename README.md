![OCR.SPACE](https://ocr.space/Content/Images/ocr.space.logo.png)

# OcrSpace

Simple API wrapper for [OCR.Space](https://ocr.space), A awesome Free api for converting images to text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocr_space_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocr_space_ruby

## Usage

#To convert images from url

```ruby
result = OcrSpace::FromUrl.new(apikey: "YOUR API KEY", url: "Image url")
puts result.data
```

#To convert images from file upload

```ruby
result = OcrSpace::FromFile.new(apikey: "YOUR API KEY", files: "Path to file")
puts result.data
```

#NOTE

I will continue working on this to make it awesomer.

#TODO

Make command line utility
