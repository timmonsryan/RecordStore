require 'rails_helper'

describe User do
	let(:user) { FactoryGirl.build(:user) }
	subject { user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest) }

	describe "with no name" do
		before { user.name = "" }
		it { should_not be_valid }
	end

	describe "with no email" do
		before { user.email = "" }
		it { should_not be_valid }
	end
end