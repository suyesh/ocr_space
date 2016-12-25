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

## Usage

#To convert images from url

![Nicola Tesla](http://bit.ly/2ih9aXt)

```ruby
require 'ocr_space'

result = OcrSpace::FromUrl.new(apikey: "YOUR API KEY", url: "http://bit.ly/2ih9aXt")

p result
=>  #<OcrSpace::FromUrl:0x007ff5ce404748 @data=#<HTTParty::Response:0x7ff5ce3efcf8 parsed_response={"ParsedResults"=>[{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}], "OCRExitCode"=>1, "IsErroredOnProcessing"=>false, "ErrorMessage"=>nil, "ErrorDetails"=>nil, "ProcessingTimeInMilliseconds"=>"345"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["no-cache"], "pragma"=>["no-cache"], "content-length"=>["454"], "content-type"=>["application/json; charset=utf-8"], "expires"=>["-1"], "server"=>["Microsoft-IIS/10.0"], "x-aspnet-version"=>["4.0.30319"], "x-powered-by"=>["ASP.NET"], "date"=>["Sun, 25 Dec 2016 22:18:22 GMT"], "connection"=>["close"]}>>

p result.text_data #Clean result

=> "If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n"
```

#To convert images from file upload

```ruby
require 'ocr_space'

result = OcrSpace::FromFile.new(apikey: "YOUR API KEY", files: "./nicola_tesla.jpg")

p result #Raw result

=>  #<OcrSpace::FromFile:0x007ff5ce3ae668 @file=#<File:./nicola_tesla.jpg>, @data=#<HTTParty::Response:0x7ff5ce2c41f8 parsed_response={"ParsedResults"=>[{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}], "OCRExitCode"=>1, "IsErroredOnProcessing"=>false, "ErrorMessage"=>nil, "ErrorDetails"=>nil, "ProcessingTimeInMilliseconds"=>"311"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["no-cache"], "pragma"=>["no-cache"], "content-length"=>["454"], "content-type"=>["application/json; charset=utf-8"], "expires"=>["-1"], "server"=>["Microsoft-IIS/10.0"], "x-aspnet-version"=>["4.0.30319"], "x-powered-by"=>["ASP.NET"], "date"=>["Sun, 25 Dec 2016 22:21:10 GMT"], "connection"=>["close"]}>>

p result.text_data #Clean result

=> "If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n"

```

#COMMAND LINE INTERFACE ***BONUS***

You can run ocr_space through shell to get quick result from a image using filepath

```
$ ocrspace home/suyesh/nicola_tesla.jpg

$ "If you want to find the secrets of the \r\nuniverse, think in terms of energy, \r\nfrequency and vibration. \r\nAZ QUOTES \r\n"

```
#NOTE
For commandline interface to work you will have to set ENV variable 'ocr_api_key' to your apikey.

```
$ export ocr_api_key='YOUR API KEY'
```
Also if you set env variable then you don't need to include apikey in your ruby scripts. You can just do the following -

```ruby
result = OcrSpace::FromFile.new(files: "./nicola_tesla.jpg") #for File based

result = OcrSpace::FromUrl.new(url: "http://bit.ly/2ih9aXt") #for URL based

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
