require 'spec_helper'

RSpec.describe RuboCop::Cop::Lint::KernelIntegerWithoutBase do
  subject(:cop) { described_class.new }

  context 'without `Kernel`' do
    it 'registers an offense when a base is omitted' do
      expect_offense(<<-RUBY.strip_indent)
        Integer('42')
        ^^^^^^^^^^^^^ Specify a base as 2nd arg. e.g. `Integer(str, base)`.
      RUBY
    end

    it 'do not registers an offense when a base is specified' do
      expect_no_offenses(<<-RUBY.strip_indent)
        Integer('42', 10)
      RUBY
    end
  end

  context 'with `Kernel`' do
    it 'registers an offense when a base is omitted' do
      expect_offense(<<-RUBY.strip_indent)
        Kernel.Integer('42')
        ^^^^^^^^^^^^^^^^^^^^ Specify a base as 2nd arg. e.g. `Integer(str, base)`.
      RUBY
    end

    it 'do not registers an offense when a base is specified' do
      expect_no_offenses(<<-RUBY.strip_indent)
        Kernel.Integer('42', 10)
      RUBY
    end
  end
end
