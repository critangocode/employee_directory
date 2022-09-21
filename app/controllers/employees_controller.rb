class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
		@employees = Employee.all
  end

  def new
		@employee = Employee.new
  end

  def create
		@employee = Employee.create(employee_params)
		if @employee.save
			flash[:notice] = "Employee created successfully!"
			redirect_to @employee
		else
			render 'new', status: :unprocessable_entity
		end
  end

  def edit
  end

  def update
		if @employee.update(employee_params)
			flash[:notice] = "Employee updated successfully!"
			redirect_to @employee
		else
			render 'edit', status: :unprocessable_entity
		end
  end

  def destroy
		@employee.destroy
		flash[:notice] = "Employee was deleted"
		redirect_to root_path, status: :see_other
	end

	private

		def set_employee
			@employee = Employee.find(params[:id])
		end

		def employee_params
			params.require(:employee).permit(:first_name, :last_name, :email, :bio)
		end
end