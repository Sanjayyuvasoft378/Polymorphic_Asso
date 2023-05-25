class EmployeesController < ApplicationController
  before_action :current_employee, only: [:show, :edit, :destroy, :update]
  def index
    @emps = Employee.all
  end

  def show
  end

  def new
    @emp = Employee.new
  end

  def create
    debugger
    @emp = Employee.new(employee_params)
    if @emp.save
      redirect_to @emp
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @emp.update(employee_params)
      redirect_to @emp
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @emp.destroy
    redirect_to employees_path, status: :see_other
  end

  def employee_params
    params.require(:employee).permit(:name)
  end

  def current_employee
    @emp = Employee.find(params[:id])
  end
end
