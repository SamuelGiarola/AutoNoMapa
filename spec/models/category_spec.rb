require 'spec_helper'

describe Category do

  fixtures :categories

  context "CRUD" do

   before(:each) do
     @category = Category.new(valid_category_hash)
   end

   it "should be save" do
    @category.save.should be_true
   end

   it "should update first category" do
    category = categories(:first_category)
    category.update_attributes(name: "Updated Category").should be_true
   end

   it "should destroy first category " do
    category = categories(:first_category)
    category.destroy
    expect {Category.find(category.id)}.to raise_error(ActiveRecord::RecordNotFound)
   end

   context "validation" do
    it "should not be valid without name" do
      @category.name = ""
      @category.should_not be_valid
    end
   end

  end

  def valid_category_hash
    {name: "Pedreiro"}
  end

end
