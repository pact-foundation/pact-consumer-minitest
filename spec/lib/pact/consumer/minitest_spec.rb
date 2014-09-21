require "minitest/autorun"
require 'minitest'
require 'pact/consumer/minitest'
require 'mocha/mini_test'
require './spec/support/test'

describe Pact::Consumer::Minitest do

  before do
    pact_test.reset
    pact_test.expects(:pact_spec_hooks).returns(spec_hooks).at_least_once
    spec_hooks.stubs(:before_all)
    spec_hooks.stubs(:before_each)
    spec_hooks.stubs(:after_each)
  end

  let(:spec_hooks) { Pact::Consumer::SpecHooks.new }
  let(:pact_test) { TestTest.new }

  describe "before_setup" do

    it "ensures SpecHooks.before_all is only called once per suite" do
      spec_hooks.expects(:before_all)
      pact_test.before_setup
      pact_test.before_setup
    end

    it "invokes SpecHooks.before_each" do
      spec_hooks.expects(:before_each).with('TestTest')
      pact_test.before_setup
    end

  end

  describe "after_teardown" do
    it "invokes SpecHooks.after_each" do
      spec_hooks.expects(:after_each).with('TestTest')
      pact_test.after_teardown
    end
  end

end

