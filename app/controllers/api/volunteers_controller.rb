class Api::VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:update]

  # POST /volunteers
  # POST /volunteers.json
  def create
    @volunteer = Volunteer.new(volunteer_params)

    respond_to do |format|
      if @volunteer.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteers/1
  # PATCH/PUT /volunteers/1.json
  def update
    respond_to do |format|
      if @volunteer.update(volunteer_params)
        format.json { render :show, status: :ok }
      else
        format.json { render json: @volunteer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params
    params.require(:volunteer).permit(:name, :email, cellphone_attributes: [:ddd, :number], residential_phone_attributes: [:ddd, :number])
  end
end
