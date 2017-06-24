module RuboCop
  module Cop
    module Lint
      # This cop checks for calls to Kernel.#Integer without a base.
      class KernelIntegerWithoutBase < Cop
        MSG = 'Specify a base as 2nd arg. e.g. `Integer(str, base)`.'.freeze

        def on_send(node)
          receiver, method_name, *args = *node

          return unless method_name == :Integer
          return unless check_receiver(receiver)
          return unless check_args(args)

          add_offense(node, :expression)
        end

        private

        def check_receiver(receiver)
          return true unless receiver
          receiver.const_type? && receiver.const_name == 'Kernel'
        end

        def check_args(args)
          args.size < 2
        end
      end
    end
  end
end
