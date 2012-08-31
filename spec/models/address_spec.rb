require 'spec_helper'

describe Address do
  context "CRUD" do
     it "should be save" do
       @address = Address.new street: :"Otaviano", number: :"123", neighborhood: :"Centro"
       @address.save.should be_true
     end
  end
end
