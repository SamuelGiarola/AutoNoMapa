require 'spec_helper'

describe SearchesProfilesController do
  describe "GET" do
    context "#index" do
      it "should render index template" do
        get :index
        response.should render_template('index')
      end
      it "should assigns @profiles" do
        get :index
        assigns(:profiles).should eq []
      end
    end
  end
end
