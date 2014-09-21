require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.pattern = "spec/lib/**/*_spec.rb"
end

Rake::TestTask.new (:integration) do |t|
  t.pattern = "spec/integration/**/*_spec.rb"
end

namespace :pact do

  desc "Ensure pact file is written"
  task 'test:pactfile' do
    pact_path = './spec/pacts/my_service_consumer-my_service_provider.json'
    FileUtils.rm_rf pact_path
    Rake::Task['integration'].execute
    fail "Did not find expected pact file at #{pact_path}" unless File.exist?(pact_path)
  end

end

task :default => [:test, :integration, :'pact:test:pactfile']