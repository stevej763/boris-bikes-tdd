require 'van'

describe Van do
  describe "#collect_broken_bikes" do
    it { is_expected.to respond_to(:collect_broken_bikes) }

    it "collects broken bikes from a docking station" do
      subject.collect_broken_bikes(docking_station)
      expect(subject.bikes).to eq 
    end
  end
end