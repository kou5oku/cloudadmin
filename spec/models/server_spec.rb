require 'spec_helper'

describe Server do

  let(:user) { FactoryGirl.create(:user) }
   before { @server = user.servers.build(name: "Lorem ipsum", address: "10.10.1.1") }

  subject { @server }

  it { should respond_to(:name) }
  it { should respond_to(:address) }
  it { should respond_to(:user_id) }


describe "when user_id is not present" do
    before { @server.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @server.name = " " }
    it { should_not be_valid }
  end

  describe "with name that is too long" do
    before { @server.name = "a" * 101 }
    it { should_not be_valid }
  end

  describe "with blank address" do
    before { @server.address = " " }
    it { should_not be_valid }
  end

  describe "with address that is too long" do
    before { @server.address = "a" * 51 }
    it { should_not be_valid }
  end



end