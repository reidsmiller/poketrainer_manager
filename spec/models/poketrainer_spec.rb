require 'rails_helper'

RSpec.describe Poketrainer, type: :model do
  describe "relationships" do
    it { should have_many :pokemons }
  end
end