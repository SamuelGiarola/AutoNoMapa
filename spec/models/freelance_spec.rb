require 'spec_helper'

describe Freelance do

  fixtures :freelances

  context "association" do
    it "should have one profile" do
      freelance = freelances(:first_freelance)
      profile = freelance.build_profile(profile_hash)
      profile.categories<< mock_model(Category)
      lambda {profile.save!}.should_not raise_error
    end
  end

  def profile_hash
    {name:"Lucas",nickname: "Lucas Pintor",cell_phone:"00000",phone:"00000",experience:"10 trabalhando na area", description: "uma pequena descricao", courses: "senai"}
  end
end
