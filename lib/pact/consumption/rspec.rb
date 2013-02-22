module Pact
  module Consumption
    module RSpec
      def assuming_a_service(name)
        FileUtils.mkdir_p PACTS_PATH
        pactfile_path = File.join(PACTS_PATH, "#{name.downcase}.json")
        MockProducer.new(name, pactfile_path)
      end
    end
  end
end

RSpec.configure do |c|
  c.include Pact::Consumption::RSpec
end

#Pact::Consumption::AppManager.instance.register(Pact::Consumption::MockService.new, Pact::Consumption::AppManager.instance.mock_port)
#RSpec.configure do |c|
#  c.before(:all, :type => :feature) do
#    Pact::Consumption::AppManager.instance.spawn_all
#  end
#end
#
#RSpec.configure do |c|
#  # After the tests run, kill the spawned apps
#  c.after(:all, :type => :feature) do
#    Pact::Consumption::AppManager.instance.kill_all
#  end
#end