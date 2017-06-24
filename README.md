# RuboCop ParseInt

RuboCop plugin to check for unsafe integer parsings

This plugin is composed of:

- Lint/KernelIntegerWithoutBase
- Lint/StringToInt (See the 'Note' section below)

## Installation

Just install the `rubocop-parse_int` gem

```bash
gem install rubocop-parse_int
```

or if you use bundler plt this in your `Gemfile`

```ruby
gem 'rubocop-parse_int'
```

## Usage

### RuboCop configuration file

Put this into your `.rubocop.yml`.

```
require: rubocop-parse_int
```

Now you can run `rubocop` and it will automatically load the RuboCop ParseInt
cops together with the standard cops.

### Command line

```bash
rubocop --require rubocop-parse_int
```

### Rake task

```ruby
RuboCop::RakeTask.new do |task|
  task.requires << 'rubocop-parse_int'
end
```

## Note

Currently, `Lint/StringToInt` responds to calls to #to_i on a non-String variable too.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hashedhyphen/rubocop-parse_int.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
