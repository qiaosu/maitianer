require 'spec_helper'

describe SyncController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'sync_babies'" do
    it "should be successful" do
      get 'sync_babies'
      response.should be_success
    end
  end

  describe "GET 'sync_photos'" do
    it "should be successful" do
      get 'sync_photos'
      response.should be_success
    end
  end

  describe "GET 'sync_milestons'" do
    it "should be successful" do
      get 'sync_milestons'
      response.should be_success
    end
  end

  describe "GET 'finish'" do
    it "should be successful" do
      get 'finish'
      response.should be_success
    end
  end

end
