require "application_system_test_case"

class SalonsTest < ApplicationSystemTestCase
  setup do
    @salon = salons(:one)
  end

  test "visiting the index" do
    visit salons_url
    assert_selector "h1", text: "Salons"
  end

  test "creating a Salon" do
    visit salons_url
    click_on "New Salon"

    fill_in "Address", with: @salon.address
    fill_in "Comment", with: @salon.comment
    check "Design" if @salon.design
    check "Ie" if @salon.ie
    fill_in "Name", with: @salon.name
    fill_in "Phone", with: @salon.phone
    check "Straight" if @salon.straight
    check "Tokio" if @salon.tokio
    click_on "Create Salon"

    assert_text "Salon was successfully created"
    click_on "Back"
  end

  test "updating a Salon" do
    visit salons_url
    click_on "Edit", match: :first

    fill_in "Address", with: @salon.address
    fill_in "Comment", with: @salon.comment
    check "Design" if @salon.design
    check "Ie" if @salon.ie
    fill_in "Name", with: @salon.name
    fill_in "Phone", with: @salon.phone
    check "Straight" if @salon.straight
    check "Tokio" if @salon.tokio
    click_on "Update Salon"

    assert_text "Salon was successfully updated"
    click_on "Back"
  end

  test "destroying a Salon" do
    visit salons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salon was successfully destroyed"
  end
end
