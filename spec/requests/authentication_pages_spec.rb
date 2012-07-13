require 'spec_helper'

describe "Authentication" do
  subject { page }
  describe "signup" do
    it "should allow sign-ups in non-production mode" do
      visit new_user_registration_path
      should have_selector('h2', text: "Sign up")
    end

    it "should not allow registrations in production mode" do
      # Rails.stub!(:env).and_return(ActiveSupport::StringInquirer.new("production"))
      stub_env "production" do
        visit new_user_registration_path
        should have_selector('h2', text: "Registrations are disabled")
      end
    end
  end    

  describe "signin" do
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        visit new_user_session_path
        fill_in "Email", :with => user.email
        fill_in "Password", :with => user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out', href: destroy_user_session_path) }
      it { should_not have_link('Sign in', href: new_user_session_path) }
    end
  end

  describe "for not signed-in users" do
    let(:user) { FactoryGirl.create(:user) }

    describe "visiting the admin home page" do
      before { visit root_path }

      it { should_not have_selector('h1', text: "Welcome to Charlie") }
      it { should have_selector('h2', text: "Sign in") }
    end
  end
end
