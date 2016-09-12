# coding: utf-8
require 'sinatra'
require 'zxing'
require 'json'

def decode_files(files)
end

get '/' do
  "working!"
end

post '/decode.?:format?' do
  files = params[:file]
  files = [files] unless files.is_a?(Array)
  results = files.map do |f|
    fn = f.is_a?(String) ? f : f[:filename]
    io = f.is_a?(String) ? f : f[:tempfile]
    {
      :filename => fn,
      :result => ZXing.decode(io)
    }
  end
  case params[:format] || 'txt'
  when 'json' then JSON.generate(results)
  when 'txt'  then results.map{|r| r[:result]}.join("\n")
  else ["Unsupported format: #{params[:foramt].inspect}", 400]
  end
end
