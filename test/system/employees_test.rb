require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase

	setup do
		sign_in users(:regular)
		visit root_url

		@employee = employees(:employee)
	end

  test "happy path for creating employee" do
    click_on "New Employee"
		fill_in "First Name:", with: "Test"
		fill_in "Last Name:", with: "User"
		fill_in "Email:", with: "testuser@example.com"
		fill_in "Biography:", with: "This is a system test for happy path on employee create action"
		click_on "Create Employee"
  
    assert_selector "p", text: "Employee created successfully!"
  end

	test "happy path for updating employee" do
		click_on "View"
		click_on "Edit"
		fill_in "First Name:", with: "Test -edited"
		fill_in "Last Name:", with: "User -edited"
		fill_in "Email:", with: "testuser+edited@example.com"
		fill_in "Biography:", with: "This is a system test for happy path on employee update action"
		click_on "Update Employee"

		assert_selector "p", text: "Employee updated successfully!"
	end

	test "happy path for deleting employee from show page" do
		click_on "View"
		page.accept_confirm do
      click_on "Delete"
    end

		assert_selector "p", text: "Employee was deleted"
	end

	# test "happy path for deleting employee from index page" do
	# 	page.accept_confirm do
  #     click_on "Delete", match: :first 
  #   end

	# 	assert_selector "p", text: "Employee was deleted"
	# end

end
