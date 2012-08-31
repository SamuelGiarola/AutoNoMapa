class SearchesProfilesController < ApplicationController

  def index
    @profiles = Profile.search(params)
    respond_with @profiles
  end

  def new
    @profile = Profile.new
  end
end
