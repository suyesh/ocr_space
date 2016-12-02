![OCR.SPACE](https://ocr.space/Content/Images/ocr.space.logo.png)

# OcrSpace

Simple API wrapper for [OCR.Space](https://ocr.space), A awesome Free api for converting images to text.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocr_space'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocr_space

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
#Optional

You can also pass in Optional attributes

```ruby

isOverlayRequired:
[#Optional] Default = False Allows you to specify if the image/pdf text overlay is required. Overlay could be #used to show the text over the image

language:

#Czech = ce; Danish = dan; Dutch = dut; English = eng; Finnish = fin; French = fre; German = ger;Hungarian=hun;
#Italian = ita; Norwegian = nor; Polish = pol; Portuguese = por; Spanish = spa; Swedish = swe; #ChineseSimplified = chs; Greek = gre; Japanese = jpn; Russian = rus; Turkish = tur; ChineseTraditional = cht; #Korean = kor
```
#NOTE

I will continue working on this to make it awesomer.

#TODO

Make command line utility
