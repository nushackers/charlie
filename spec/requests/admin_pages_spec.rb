require 'spec_helper'

describe "Admin pages" do 

  subject { page }

  describe "admin home page" do
    before { visit root_path }

    it { should have_selector('h1', text: "Welcome to Charlie") }
  end
end
