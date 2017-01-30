![OCR.SPACE](https://ocr.space/Content/Images/ocr.space.logo.png)
[![Gem Version](https://badge.fury.io/rb/ocr_space.svg)](https://badge.fury.io/rb/ocr_space)

# OcrSpace

Simple API wrapper for [OCR.Space](https://ocr.space), A awesome Free api for converting images to text. Register [here](http://space.us11.list-manage1.com/subscribe?u=ce17e59f5b68a2fd3542801fd&id=252aee70a1) for free api key.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ocr_space'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ocr_space

Hosted at [rubygems.org](https://rubygems.org/gems/ocr_space)

#ENV Variables (Optional)
setting env variables with api key is optional but for commandline interface to work you will have to set ENV variable 'ocr_api_key' to your apikey. For more details on Command line interface, scroll to the bottom of this page.

```
$ export ocr_api_key='YOUR API KEY'
```

## Usage

![Nicola Tesla](http://bit.ly/2ih9aXt)

## Instantiate OcrSpace resource with apikey

```ruby
require 'ocr_space'

resource = OcrSpace::Resource.new(apikey: "YOUR API KEY")
#By default it picks up ocr_api_key='YOUR API KEY' from your env variables
```

#To convert images from url

```ruby

result = resource.convert url: "http://bit.ly/2ih9aXt"

puts result
=>  #[{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}]

result = resource.clean_convert url: "http://bit.ly/2ih9aXt"

puts result

=> #If you want to find the secrets of the universe, think in terms of energy, frequency and vibration. AZ QUOTES
```

#To convert images from file upload

```ruby

result = resource.convert file: "/Users/suyesh/Desktop/nicola_tesla.jpg"

puts result #Raw result

=>  #{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}

result = resource.clean_convert file: "/Users/suyesh/Desktop/nicola_tesla.jpg"

puts result

=> #If you want to find the secrets of the universe, think in terms of energy, frequency and vibration. AZ QUOTES
```

#COMMAND LINE INTERFACE ***BONUS***

You can run ocr_space through shell to get quick result from a image using filepath or url

```
$ ocrspace /Users/suyesh/Desktop/nicola_tesla.jpg

=> If you want to find the secrets of the universe, think in terms of energy, frequency and vibration. AZ QUOTES

```

#Optional

You can also pass in Optional attributes

```ruby

isOverlayRequired:
#[Optional] Default = False Allows you to specify if the image/pdf text overlay is required. Overlay could be #used to show the text over the image

language:

#Czech = ce; Danish = dan; Dutch = dut; English = eng; Finnish = fin; French = fre; German = ger;Hungarian=hun;
#Italian = ita; Norwegian = nor; Polish = pol; Portuguese = por; Spanish = spa; Swedish = swe; #ChineseSimplified = chs; Greek = gre; Japanese = jpn; Russian = rus; Turkish = tur; ChineseTraditional = cht; #Korean = kor
```
