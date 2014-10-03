require 'spec_helper'

describe 'Sign Up' do
	subject { page }
	before { visit signup_path }

	it { should have_content("Sign Up") }
end
