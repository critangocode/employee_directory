require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase

	setup do
		sign_in users(:regular)
	end

  test "visiting the index" do
    visit employees_url
  
    assert_selector "h1", text: "Employees"
  end
end
