class AssignmentsController < ApplicationController
  before_action :load_person

  def new
    @assignment = Assignment.new
    @locations = Location.all
  end

  def create
    @assignment = Assignment.new(assignment_params.merge(person_id: @person.id))
    if @assignment.save
      redirect_to person_path(@person), notice: 'Assignment created.'
    else
      @locations = Location.all
      flash.now[:error] = "Assignment could not be created."
      render :new
    end

  end

  def edit
    @assignment = Assignment.find(params[:id])
    @locations = Location.all

    render :new
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update_attributes(assignment_params)
      redirect_to person_path(@person), notice: 'Assignment updated.'
    else
      @locations = Location.all
      flash.now[:error] = "Assignment could not be updated."
      render :new
    end
  end

  def destroy
    Assignment.find(params[:id]).destroy
    redirect_to person_path(@person), notice: 'Assignment deleted.'
  end

  private

  def load_person
    @person = Person.find(params[:person_id])
  end

  def assignment_params
    params.require(:assignment).permit(:location_id, :role)
  end
end