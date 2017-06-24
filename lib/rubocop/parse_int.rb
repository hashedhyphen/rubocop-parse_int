require 'rubocop'
require 'rubocop/parse_int/version'
require 'rubocop/parse_int/inject'

RuboCop::ParseInt::Inject.defaults!

# cops
require 'rubocop/cop/lint/string_to_int'
require 'rubocop/cop/lint/kernel_integer_without_base'
