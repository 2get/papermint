require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:tasks) }
  it { should respond_to(:feed_1) }
  it { should respond_to(:feed_2) }
  it { should respond_to(:feed_3) }
  it { should respond_to(:feed_4) }

  it { should be_valid }

  describe 'when name is not present' do
    before { @user.name = " " }
    it { should_not be_valid }
  end
end
