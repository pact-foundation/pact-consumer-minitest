require './spec/support/client.rb'

require 'minitest/autorun'
require 'minitest'
require 'pact/consumer/minitest'

Pact.service_consumer "My Other Service Consumer" do
  has_pact_with "My Other Service Provider" do
    mock_service :my_other_service_provider do
      port 1235
    end
  end
end

class MyOtherServiceProviderClientTest < Minitest::Test

  include Pact::Consumer::Minitest

  def setup
    my_other_service_provider.given("something exists").
      upon_receiving("a request for something").with(method: :get, path: '/something', query: '').
      will_respond_with(
        status: 200,
        headers: {'Content-Type' => 'application/json'},
        body: {name: 'A small something'} )

    MyServiceProviderClient.base_uri 'localhost:1235'
    @subject = MyServiceProviderClient.new
  end

  def test_that_get_something_returns_something
    assert_equal(@subject.get_something, Something.new('A small something'))
  end

end
