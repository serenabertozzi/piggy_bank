require "piggy_bank"

describe PiggyBank do
  it { is_expected.to respond_to :add_coins }
  it "add coins to the Piggy Bank" do
    expect(subject.add_coins(2)).to(eq(2))
  end

  it "checks if isn't empty" do
    subject.add_coins(2)
    expect(subject.shake).to(eq("cling cling"))
  end

  it { is_expected.to respond_to :shake }

  it "raises an error if it's empty" do
    expect { subject.shake }.to raise_error "It's empty!"
  end

  it { is_expected.to respond_to :break }

  it "returns the total of coins when broken" do
    subject.add_coins(10)
    expect(subject.break).to(eq(10))
  end

  it "cannot be shaken after being broken" do
    subject.add_coins(10)
    subject.break
    expect { subject.shake }.to raise_error "It's broken!"
  end

  it "cannot add coins after being broken" do
    subject.break
    expect { subject.add_coins(10) }.to raise_error "It's broken!"
  end

  it "cannot break after being broken" do
    subject.break
    expect { subject.break }.to raise_error "It's broken!"
  end
end
