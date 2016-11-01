class VolunteerCreator
  def self.call(*args)
    new(*args).call
  end

  def initialize(params = {})
    self.params = params
  end

  def call
    transaction do
      volunteer = volunteer_repository.new
      volunteer.name = params[:name]
      volunteer.email = params[:email]
      volunteer.terms_to_receive = params[:terms_to_receive]
      volunteer.save!

      if params[:cellphone_attributes].present?
        cellphone = volunteer.build_cellphone(params[:cellphone_attributes])
        cellphone.kind = Phone.kinds[:cell]
        cellphone.save
      end

      if params[:residential_phone_attributes].present?
        residential_phone = volunteer.build_residential_phone(params[:residential_phone_attributes])
        residential_phone.kind = Phone.kinds[:residential]
        residential_phone.save
      end

      if params[:address_attributes].present?
        volunteer.build_address(params[:address_attributes])
      end

      if params[:home_distribution_attributes].present?
        volunteer.build_home_distribution(params[:home_distribution_attributes])
      end

      if params[:attending_church_attributes].present?
        attending_church_attributes = params[:attending_church_attributes].delete(:address_attributes)

        attending_church = volunteer.build_attending_church(params[:attending_church_attributes])
        attending_church.build_address(attending_church_attributes)
        attending_church.save
      end

      volunteer.save!
    end
  end

  protected

  attr_accessor :params

  def volunteer_repository
    Volunteer
  end

  def transaction(&block)
    ActiveRecord::Base.transaction do
      block.call
    end
  end
end
