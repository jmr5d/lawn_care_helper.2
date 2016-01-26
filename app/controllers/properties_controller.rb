class PropertiesController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]
  before_filter :set_zillow_api_id
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = Property.all.where(:user_id => current_user.id)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    concatAddress = @property.address1 + " " + @property.address2
    concatCity = @property.city + ", " + @property.state + " " + @property.zipcode
    @zillowProperty = Rubillow::PropertyDetails.deep_search_results({ :address => concatAddress, :citystatezip => concatCity })
    #zillowPropertyBasics = Rubillow::PropertyDetails.property_basics({ :address => '130 Stewarts Landing Cir', :citystatezip => 'Smyrna, TN 37167' })
    # @zAddress = Rubillow::PropertyDetails.city
    # '48749425'
    # if property.success?
    #   puts property.price
    # end

  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id           # sets user id for the property record so that it belongs to current user

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:address1, :address2, :city, :state, :latitude, :longitude, :altitude,
        :country, :zipcode, :size_in_acres, :user_id)
    end

    def set_zillow_api_id
      Rubillow.configure do |configuration|
        configuration.zwsid = "X1-ZWz1f4ust52vij_86zet"
      end
    end
end
