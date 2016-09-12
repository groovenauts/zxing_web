# coding: utf-8
require 'zxing_web'

require 'sinatra/base'
require 'zxing'
require 'json'

module ZxingWeb
  class App < Sinatra::Base

    get '/' do
      "working!"
    end

    post '/decode' do
      results = decode_files(params[:file])
      results.map{|r| r[:result]}.join("\n")
    end

    post '/decode.json' do
      results = decode_files(params[:file])
      JSON.generate(results)
    end

    private

    def decode_files(files)
      files = params[:file]
      files = [files] unless files.is_a?(Array)
      return files.map do |f|
        fn = f.is_a?(String) ? f : f[:filename]
        io = f.is_a?(String) ? f : f[:tempfile]
        {
          :filename => fn,
          :result => ZXing.decode(io)
        }
      end
    end

  end
end
