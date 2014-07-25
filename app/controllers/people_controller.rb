class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def new
    @person = Person.new
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(person_params)
      redirect_to person_path(@person)
    else
      flash.now[:error] = "Person could not be updated."
      render :edit
    end
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to root_path, notice: "Person was created!"
    else
      flash.now[:error] = "Person could not be created."
      render :new
    end
  end

  private
  def person_params
    params.require(:person).permit(:title, :first_name, :last_name)
  end

end