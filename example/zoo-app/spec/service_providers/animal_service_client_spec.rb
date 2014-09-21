require_relative 'pact_helper'
require 'zoo_app/animal_service_client'

module ZooApp
  describe AnimalServiceClient do

    include Pact::Consumer::Minitest

    before do
      AnimalServiceClient.base_uri animal_service.mock_service_base_url
    end

    describe ".find_alligator_by_name" do
      describe "when an alligator by the given name exists" do

        before do
          animal_service.given("there is an alligator named Mary").
            upon_receiving("a request for an alligator").with(
              method: :get,
              path: '/alligators/Mary',
              headers: {'Accept' => 'application/json'} ).
            will_respond_with(
              status: 200,
              headers: {'Content-Type' => 'application/json;charset=utf-8'},
              body: {name: 'Mary'}
            )
        end

        it "returns the alligator" do
          assert_equal(AnimalServiceClient.find_alligator_by_name("Mary"), ZooApp::Animals::Alligator.new(name: 'Mary'))
        end

      end

      describe "when an alligator by the given name does not exist" do

        before do
          animal_service.given("there is not an alligator named Mary").
            upon_receiving("a request for an alligator").with(
              method: :get,
              path: '/alligators/Mary',
              headers: {'Accept' => 'application/json'} ).
            will_respond_with(status: 404)
        end

        it "returns nil" do
          assert_equal(AnimalServiceClient.find_alligator_by_name("Mary"), nil)
        end

      end

      describe "when an error occurs retrieving the alligator" do

        before do
          animal_service.given("an error occurs retrieving an alligator").
            upon_receiving("a request for an alligator").with(
              method: :get,
              path: '/alligators/Mary',
              headers: {'Accept' => 'application/json'}).
            will_respond_with(
              status: 500,
              headers: { 'Content-Type' => 'application/json;charset=utf-8'},
              body: {error: 'Argh!!!'})
        end

        it "raises an error" do
          error = ->{ AnimalServiceClient.find_alligator_by_name("Mary") }.must_raise AnimalServiceError
          error.message.must_match /Argh/
        end

      end
    end
  end
end