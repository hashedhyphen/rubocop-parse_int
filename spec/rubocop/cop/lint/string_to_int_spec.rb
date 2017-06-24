require 'spec_helper'

RSpec.describe RuboCop::Cop::Lint::StringToInt do
  subject(:cop) { described_class.new }

  context 'when #to_i is called on a String literal' do
    it 'registers an offense' do
      expect_offense(<<-RUBY.strip_indent)
        '42'.to_i
        ^^^^^^^^^ Perhaps String#to_i is called? Use `Integer(str, base)`.
      RUBY
    end
  end

  context 'when #to_i is called on a variable' do
    it 'registers an offense' do
      expect_offense(<<-RUBY.strip_indent)
        val = 42
        val.to_i
        ^^^^^^^^ Perhaps String#to_i is called? Use `Integer(str, base)`.
      RUBY
    end
  end

  context 'when #to_i is called on a non-String literal' do
    it 'do not registers an offense' do
      expect_no_offenses(<<-RUBY.strip_indent)
        (42.0).to_i
      RUBY
    end
  end
end
