require 'minitest'
require 'pact/consumer/minitest/version'
require 'pact/consumer'
require 'pact/consumer/spec_hooks'

module Pact
  module Consumer
    module Minitest

      include Pact::Consumer::ConsumerContractBuilders

      def pact_spec_hooks
        @@pact_spec_hooks ||= Pact::Consumer::SpecHooks.new
      end

      module_function :pact_spec_hooks

      def before_suite
        unless defined?(@@before_suite_hook_ran) && @@before_suite_hook_ran
          pact_spec_hooks.before_all
          @@before_suite_hook_ran = true
        end
      end

      def before_setup
        super
        before_suite
        pact_spec_hooks.before_each self.class.name
      end

      def after_teardown
        super
        pact_spec_hooks.after_each self.class.name
      end

    end
  end
end

after_suite_hook = Minitest.respond_to?(:after_run) ? :after_run : :after_tests

Minitest.send(after_suite_hook) do
  Pact::Consumer::Minitest.pact_spec_hooks.after_suite
end
