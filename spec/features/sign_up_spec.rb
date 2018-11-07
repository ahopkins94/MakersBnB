feature do
  it 'has a sign up page' do
    visit '/sign_up'
    expect(page).to have_field "email"
    expect(page).to have_field "password"
    expect(page).to have_button "sign up"
  end

  it "signs up a user" do
    visit '/sign_up'
    fill_in 'email', with: "fakeemail@mail.com"
    fill_in 'password', with: "fakepassword"
    click_button 'sign up'
    expect(page).to have_content "Welcome to MakersBnB: fakeemail@mail.com"
  end

  it "doesn't see user sign out button if not signed in" do
    visit '/'
    expect(page).to have_button 'sign up'
    expect(page).not_to have_button 'sign out'
  end

  it "doesn't see sign in button if already signed in" do
    visit '/sign_up'
    fill_in 'email', with: "fakeemail@mail.com"
    fill_in 'password', with: "fakepassword"
    click_button 'sign up'
    expect(page).to have_button 'sign out'
    expect(page).not_to have_button 'sign up'

  end

  it "does not sign up a user if email is already taken" do
    visit '/sign_up'
    fill_in 'email', with: "fakeemail@mail.com"
    fill_in 'password', with: "fakepassword"
    click_button 'sign up'
    click_button 'sign out'
    visit '/sign_up'
    fill_in 'email', with: "fakeemail@mail.com"
    fill_in 'password', with: "fakepassword"
    click_button 'sign up'
    expect(page).to have_content 'email is already taken!'
  end

end
