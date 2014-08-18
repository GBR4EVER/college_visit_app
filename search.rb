class Search < ActiveRecord::Base
  has_many :colleges

  def initialize(resource=nil)
    @params = {}
    @resource = resource.nil? ? '/search/school' : resource
    self
  end
  
  
  def query(query)
    @params[:query] = "#{query}"
    self
  end

  def state(state)
    @params[:state] = "#{state}"
    self
  end

  def city(city)
    @params[:city] = "#{city}"
    self
  end

  def resource(resource)
    @resource = case resource
    when 'school'
      '/search/school'
    when 'region'
      '/search/region'
    when 'state'
      '/search/state'
    when 'city'
      '/search/city'
    end
    self
  end

  def filter(conditions)
    if conditions
      conditions.each do |key, value|
        if self.respond_to?(key)
          self.send(key, value)
        else
          @params[key] = value
        end
      end
    end
  end


  # Sends back data retrieved.
  def fetch
    fetch_response.results
  end


end
