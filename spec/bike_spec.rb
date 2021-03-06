require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working)}
  it 'is working by default' do
    expect(subject.working).to eq(true)
  end

  it 'can be broken' do
    subject.working = false
    expect(subject.working).to eq(false)
  end

end