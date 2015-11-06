require "test_helper"

module Devise
  describe "Async" do

    after do
      Async.backend = :resque
    end

    it "yields self when setup is called" do
      Async.setup { |config| config.must_equal Async }
    end

    it "stores backend config" do
      Async.backend = :something
      Async.backend.must_equal :something
    end

    it "stores enabled config" do
      Async.backend = false
      Async.backend.must_equal false
    end

    it "stores priority config" do
      Async.priority = 15
      Async.priority.must_equal 15
      Async.priority = nil
    end

    it "stores deliver_method" do
      Async.deliver_method = :deliver_now!
      Async.priority.must_equal :deliver_now!
    end

  end
end
