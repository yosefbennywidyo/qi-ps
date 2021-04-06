require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  let (:user) { create_list(:user, 2) }

  context "as unregistered users" do
    it "able to view home#index" do
      visit root_path

      expect(page).to have_content "Welcome to PlaceSharing"
      expect(page).to have_content "Let's go share"

      expect(page).to have_link("Home", href: root_path)
      expect(page).to have_link("Places", href: places_path)
      expect(page).to have_link("Users List", href: "/users_list")
      expect(page).to have_link("Signup", href: new_user_registration_path)
      expect(page).to have_link("Signin", href: new_user_session_path)
    end

    it "able to view Places shared by Users" do
      visit root_path

      expect(page).to have_link("Home", href: root_path)
      expect(page).to have_link("Places", href: places_path)
      expect(page).to have_link("Users List", href: "/users_list")
      expect(page).to have_link("Signup", href: new_user_registration_path)
      expect(page).to have_link("Signin", href: new_user_session_path)

      click_link "Places"

      expect(page).to have_content "Public Places shared by Users"
      expect(page).not_to have_link("Create ")
    end

    it "able to signup" do
      visit root_path

      click_link "Signup"

      fill_in 'Username', with: 'sample_username'
      fill_in 'Email', with: 'sample_email@example.com'
      fill_in 'Password', with: 'qwertyuio'
      fill_in 'Password confirmation', with: 'qwertyuio'

      click_button "Sign up"

      expect(current_path).to eq root_path
    end
  end

  context "as registered users" do
    it "able to view Places shared by Users" do
      visit root_path

      click_link "Signin"
      
      fill_in 'Email', with: user.first.email
      fill_in 'Password', with: user.first.password
      click_button "Log in"

      expect(page).to have_content "Signed in successfully."

      click_link "Places"

      expect(page).to have_content "Public Places shared by Users"
      expect(page).to have_content "#{user.first.username}"
      expect(page).to have_content "#{user.second.username}"

      expect(page).to have_link("Home", href: root_path)
      expect(page).to have_link("Places", href: places_path)
      expect(page).to have_link("Users List", href: "/users_list")
      expect(page).to have_link("Signout")
    end

    it "able to create new PlaceSharing" do
      visit root_path

      logged_in_user = user.first

      click_link "Signin"

      fill_in 'Email', with: logged_in_user.email
      fill_in 'Password', with: logged_in_user.password
      click_button "Log in"

      expect(page).to have_content "Signed in successfully."

      click_link "Places"

      click_link "Add new Place"

      fill_in 'Name', with: "#{Faker::Address::city}"
      fill_in 'Latitude', with: "#{Faker::Address::latitude}"
      fill_in 'Longitude', with: "#{Faker::Address::longitude}"
      click_button "Create Place"

      page.has_css?('#map', visible: false)
      
      expect(page).to have_content "#{logged_in_user.places.last.name}"
      expect(page).to have_content "Shared by: #{logged_in_user.username}"
    end
  end
end
