require 'spec_helper'

describe Freelances::ProfilesController do

  fixtures :profiles
  login_freelance

  describe "GET" do

    context "#show" do

      it "should have a current freelance" do
        subject.current_freelance.should_not be_nil
      end

      it "renders the show template" do
        get :show
        response.should render_template("show")
      end

      it "assigns @profile" do
        get :show
        assigns(:profile).should eq profiles(:first_profile)
      end
    end

    context "#edit" do
      it "renders the edit template" do
        get :edit
        response.should render_template("edit")
      end

      it "assigns @profile" do
        get :edit
        assigns(:profile).should eq profiles(:first_profile)
      end
    end

    context "#new" do
      it "renders the form template" do
        get :new
        response.should render_template("new")
      end

      it "assigns @profile" do
        get :new
        assigns(:profile).class.should eq Profile
      end
    end
  end

  describe "POST" do
    context "#create" do
      it "response status ok" do
        post :create, valid_profile_hash
        lambda {response}.should_not raise_error
      end
    end
  end

  describe "PUT" do
    context "#update" do
      it "response status ok" do
        put :update, nickname: "Jao"
        lambda { response  }.should_not raise_error
      end
    end
  end

  describe "DELETE" do
    context "#destroy" do
      it "response shouldn't raise error'" do
        delete :destroy
        lambda { response }.should_not raise_error
      end
    end
  end

  def valid_profile_hash
   { profile: {name: "Joao", cell_phone: "(35) 000 0000", phone: "(35) 000 0000", experience: "Muito tempo trabalhando na area"}, category_ids:{name: "Pintor"}}
  end
end
