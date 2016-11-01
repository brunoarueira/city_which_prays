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
    params.require(:volunteer)
          .permit(:name,
                  :email,
                  :terms_to_receive,
                  cellphone_attributes: [:ddd, :number, :whatsapp],
                  residential_phone_attributes: [:ddd, :number],
                  address_attributes: [:name, :number, :complement, :neighborhood, :city, :state, :zipcode],
                  home_distribution_attributes: [
                    :except_homes, :numbers_from_buildings, :number_from_homes_to_distribute, :deliver_on_building_for_all, :building_name
                  ],
                  attending_church_attributes: [
                    :name, :main_leader, address_attributes: [:name, :number, :complement, :neighborhood, :city, :state, :zipcode]
                  ])
  end
end
