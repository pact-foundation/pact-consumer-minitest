require 'httparty'

class Something

  attr_reader :name

  def initialize name
    @name = name
  end

  def == other
    other.is_a?(Something) && other.name == name
  end
end

class MyServiceProviderClient

  include HTTParty

  base_uri 'http://my-service'

  def get_something
    name = JSON.parse(self.class.get("/something").body)['name']
    Something.new(name)
  end

end
