require './spec/support/client.rb'

require 'minitest/autorun'
require 'minitest'
require 'pact/consumer/minitest'

Pact.service_consumer "My Service Consumer" do
  has_pact_with "My Service Provider" do
    mock_service :my_service_provider do
      port 1234
    end
  end
end

describe MyServiceProviderClient do

  include Pact::Consumer::Minitest

  before do
    MyServiceProviderClient.base_uri 'localhost:1234'
  end

  subject { MyServiceProviderClient.new }

  describe "get_something" do

    before do
      my_service_provider.given("something exists").
        upon_receiving("a request for something").with(method: :get, path: '/something', query: '').
        will_respond_with(
          status: 200,
          headers: {'Content-Type' => 'application/json'},
          body: {name: 'A small something'} )
    end

    it "returns a Something" do
      assert_equal(subject.get_something, Something.new('A small something'))
    end

  end

end
