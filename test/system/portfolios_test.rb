require "application_system_test_case"

class PortfoliosTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Niels-Jonas Simons"
  end
end
