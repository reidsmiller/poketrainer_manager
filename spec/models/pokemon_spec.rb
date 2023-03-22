require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  describe "relationships" do
    it { should belong_to :poketrainer }
  end
end