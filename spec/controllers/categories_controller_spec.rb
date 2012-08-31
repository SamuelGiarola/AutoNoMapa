require 'spec_helper'

describe CategoriesController do

  fixtures :categories

  describe "GET" do

    context "#index" do
      it "renders the index template" do
        get :index
        response.should render_template("index")
      end

      it "assings @categories" do
        @categories = build_categories
        get :index
        assigns(:categories).should eql(@categories)
      end
    end

    context "#show" do
      it "renders the show template" do
        get :show, id: categories(:first_category)
        response.should render_template("show")
      end

      it "assings @category" do
        get :show, id: categories(:second_category).id
        assigns(:category).should eql(categories(:second_category))
      end
    end

    context "#new" do
      it "renders the form template" do
        get :new
        response.should render_template("new")
      end

      it "assigns @category" do
        get :new
        assigns(:category).class.should eql(Category)
      end
    end

    context "#edit" do
      it "renders the edit form template" do
        get :edit, id: categories(:second_category).id
        response.should render_template("edit")
      end
      it "assigns @category" do
        get :edit, id: categories(:second_category).id
        assigns(:category).should eql(categories(:second_category))
      end
    end
  end

  describe "POST" do
    context "#create" do
      it "response status ok" do
        post :create, name: categories(:first_category).name
        lambda {response}.should_not raise_error
        response.code.should eq "200"
      end
    end
  end

  describe "PUT" do
    context "#update" do
      it "response status ok " do
        category = categories(:second_category)
        put :update, name: "Category new", id: category.id
        lambda {response}.should_not raise_error
      end
    end
  end

  describe "DELETE" do
    context "#destroy" do
      it "response status ok" do
        delete :destroy, id: categories(:first_category).id
        lambda{response}.should_not raise_error
      end
    end
  end

  def build_categories
    @categories = Array.new
    @categories<< categories(:first_category)
    @categories<< categories(:second_category)
  end

end
