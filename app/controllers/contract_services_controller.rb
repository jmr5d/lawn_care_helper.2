class ContractServicesController < ApplicationController
  before_action :set_contract_service, only: [:show, :edit, :update, :destroy]

  # GET /contract_services
  # GET /contract_services.json
  def index
    @contract_services = ContractService.all
  end

  # GET /contract_services/1
  # GET /contract_services/1.json
  def show
  end

  # GET /contract_services/new
  def new
    @contract_service = ContractService.new
  end

  # GET /contract_services/1/edit
  def edit
  end

  # POST /contract_services
  # POST /contract_services.json
  def create
    @contract_service = ContractService.new(contract_service_params)

    respond_to do |format|
      if @contract_service.save
        format.html { redirect_to @contract_service, notice: 'Contract service was successfully created.' }
        format.json { render :show, status: :created, location: @contract_service }
      else
        format.html { render :new }
        format.json { render json: @contract_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contract_services/1
  # PATCH/PUT /contract_services/1.json
  def update
    respond_to do |format|
      if @contract_service.update(contract_service_params)
        format.html { redirect_to @contract_service, notice: 'Contract service was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract_service }
      else
        format.html { render :edit }
        format.json { render json: @contract_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_services/1
  # DELETE /contract_services/1.json
  def destroy
    @contract_service.destroy
    respond_to do |format|
      format.html { redirect_to contract_services_url, notice: 'Contract service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract_service
      @contract_service = ContractService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_service_params
      params.require(:contract_service).permit(:contract_id, :service_type_id)
    end
end
