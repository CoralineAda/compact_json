# CompactJSON

CompactJSON is a summary-only JSON formatter for SimpleCov. For complete JSON
output you probably want [simplecov-json](https://github.com/vicentllongo/simplecov-json).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simplecov_compact_json', require: false
```

And then execute:
    `$ bundle`

Now in your spec helper:

```ruby
SimpleCov.formatters = [
  SimpleCov::Formatter::CompactJSON
]
```

The results will be written to `coverage/results.json`

## Sample Output

```
{
  "summary": {
    "coverage": 50.00
  },
  "files": [
    {
      "filename": "foo.rb",
      "coverage": 100.00
    },
    {
      "filename": "bar.rb",
      "coverage": 0.00
    }
  ]
}
```

## Contributing

Please note that this project is released with a [Contributor Code of Conduct]
(http://contributor-covenant.org/version/1/0/0/).
By participating in this project you agree to abide by its terms.

1. Fork it ( https://github.com/[my-github-username]/simplecov-json-lite/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
