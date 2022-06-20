class HomeController < ApplicationController
  def index

  end

  def redis
    redis = Redis.new(host: ENV['REDIS_HOST'])

    redis.set('test_var', SecureRandom.uuid)
    @test_var = redis.get('test_var')
  end
end
