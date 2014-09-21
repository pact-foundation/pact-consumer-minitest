module BaseTest

  # Need this to support the 'super' calls
  def before_setup; end
  def after_teardown; end

end

module Pact
  module Consumer
    module Minitest
      def reset
        # Dirty hack to clear @@before_suite_hook_ran flag
        # for tests
        @@before_suite_hook_ran = false
      end
    end
  end
end

class TestTest
  include BaseTest
  include Pact::Consumer::Minitest
end

module Pact
  module  Consumer
    class SpecHooks
      def after_suite
        # Override - will try and actually shutdown mock servers otherwise
      end
    end
  end
end