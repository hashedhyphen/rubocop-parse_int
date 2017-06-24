module RuboCop
  module Cop
    module Lint
      # This cop checks for possible calls to String#to_i instead of
      # Kernel#.Integer.
      class StringToInt < Cop
        MSG = 'Perhaps String#to_i is called? Use `Integer(str, base)`.'.freeze

        def on_send(node)
          receiver, method_name, * = *node

          return unless method_name == :to_i
          return unless check_receiver(receiver)

          add_offense(node, :expression)
        end

        private

        def check_receiver(receiver)
          return false unless receiver
          receiver.str_type? || receiver.lvar_type?
        end
      end
    end
  end
end
