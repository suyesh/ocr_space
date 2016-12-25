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

```ruby
result = OcrSpace::FromUrl.new(apikey: "YOUR API KEY", url: "http://i.stack.imgur.com/vrkIj.png")

puts result #Raw result

=>  #<OcrSpace::FromUrl:0x007ff524394128 @data=#<HTTParty::Response:0x7ff52433fc68 parsed_response={"ParsedResults"=>[{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"I am curious about \r\narea-filling text \r\nrendering options \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}], "OCRExitCode"=>1, "IsErroredOnProcessing"=>false, "ErrorMessage"=>nil, "ErrorDetails"=>nil, "ProcessingTimeInMilliseconds"=>"325"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["no-cache"], "pragma"=>["no-cache"], "content-length"=>["395"], "content-type"=>["application/json; charset=utf-8"], "expires"=>["-1"], "server"=>["Microsoft-IIS/10.0"], "x-aspnet-version"=>["4.0.30319"], "x-powered-by"=>["ASP.NET"], "date"=>["Fri, 02 Dec 2016 04:09:45 GMT"], "connection"=>["close"]}>>

puts result.text_data #Clean result

=> "I am curious about \r\narea-filling text \r\nrendering options \r\n"
```

#To convert images from file upload

```ruby
result = OcrSpace::FromFile.new(apikey: "YOUR API KEY", files: "./vrkIj.png")

puts result #Raw result

=>  #<OcrSpace::FromUrl:0x007ff524394128 @data=#<HTTParty::Response:0x7ff52433fc68 parsed_response={"ParsedResults"=>[{"TextOverlay"=>{"Lines"=>[], "HasOverlay"=>false, "Message"=>"Text overlay is not provided as it is not requested"}, "FileParseExitCode"=>1, "ParsedText"=>"I am curious about \r\narea-filling text \r\nrendering options \r\n", "ErrorMessage"=>"", "ErrorDetails"=>""}], "OCRExitCode"=>1, "IsErroredOnProcessing"=>false, "ErrorMessage"=>nil, "ErrorDetails"=>nil, "ProcessingTimeInMilliseconds"=>"325"}, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["no-cache"], "pragma"=>["no-cache"], "content-length"=>["395"], "content-type"=>["application/json; charset=utf-8"], "expires"=>["-1"], "server"=>["Microsoft-IIS/10.0"], "x-aspnet-version"=>["4.0.30319"], "x-powered-by"=>["ASP.NET"], "date"=>["Fri, 02 Dec 2016 04:09:45 GMT"], "connection"=>["close"]}>>

puts result.text_data #Clean result

=> "I am curious about \r\narea-filling text \r\nrendering options \r\n"
```

#COMMAND LINE INTERFACE ***BONUS***

You can run ocr_space through shell to get quick result from a image in a folder

```
$ ocrspace vrkIj.png

$ "I am curious about \r\narea-filling text \r\nrendering options \r\n"
```
#NOTE
For commandline interface to work you will have to set ENV variable 'ocr_api_key' to your apikey.

#Optional

You can also pass in Optional attributes

```ruby

isOverlayRequired:
#[Optional] Default = False Allows you to specify if the image/pdf text overlay is required. Overlay could be #used to show the text over the image

language:

#Czech = ce; Danish = dan; Dutch = dut; English = eng; Finnish = fin; French = fre; German = ger;Hungarian=hun;
#Italian = ita; Norwegian = nor; Polish = pol; Portuguese = por; Spanish = spa; Swedish = swe; #ChineseSimplified = chs; Greek = gre; Japanese = jpn; Russian = rus; Turkish = tur; ChineseTraditional = cht; #Korean = kor
```
