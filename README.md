# ZxingWeb

zxing_web is an web server to decode barcode image files.

## Installation

```bash
$ gem install zxing_web
```

### Docker Container

Planning...


## Usage

### Run Server

```bash
zxing_web
```

### Call API

Single URL

```bash
$ curl http://localhost:4567/decode -F file=https://upload.wikimedia.org/wikipedia/commons/2/2d/Qr-3.png
```

Single File

```bash
$ curl http://localhost:4567/decode -F file=@path/to/imagefile.jpg
```


Multiple URLs or Files

```bash
$ curl http://localhost:4567/decode -F "file[]=@path/to/imagefile.jpg" -F "file[]=https://upload.wikimedia.org/wikipedia/commons/8/8f/Qr-2.png"
```


## Development

### Run

```bash
$ ruby -I ./lib exe/zxing_web
```

### Debug Build

```
$ bundle exec rake install
$ rbenv rehash
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zxing_web. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

