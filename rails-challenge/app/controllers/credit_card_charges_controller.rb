class CreditCardChargesController < ApplicationController
  before_action :set_credit_card_charge, only: %i[ show edit update destroy ]

  # GET /credit_card_charges or /credit_card_charges.json
  def index
    @credit_card_charges = CreditCardCharge.all
    @failed_charges = CreditCardCharge.failed
    @disputed_charges = CreditCardCharge.disputed
    @successful_charges = CreditCardCharge.successful
  end

  # GET /credit_card_charges/1 or /credit_card_charges/1.json
  def show
  end

  # GET /credit_card_charges/new
  def new
    @credit_card_charge = CreditCardCharge.new
  end

  # GET /credit_card_charges/1/edit
  def edit
  end

  # POST /credit_card_charges or /credit_card_charges.json
  def create
    @credit_card_charge = CreditCardCharge.new(credit_card_charge_params)

    respond_to do |format|
      if @credit_card_charge.save
        format.html { redirect_to credit_card_charge_url(@credit_card_charge), notice: "Credit card charge was successfully created." }
        format.json { render :show, status: :created, location: @credit_card_charge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @credit_card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_card_charges/1 or /credit_card_charges/1.json
  def update
    respond_to do |format|
      if @credit_card_charge.update(credit_card_charge_params)
        format.html { redirect_to credit_card_charge_url(@credit_card_charge), notice: "Credit card charge was successfully updated." }
        format.json { render :show, status: :ok, location: @credit_card_charge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @credit_card_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_charges/1 or /credit_card_charges/1.json
  def destroy
    @credit_card_charge.destroy

    respond_to do |format|
      format.html { redirect_to credit_card_charges_url, notice: "Credit card charge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_charge
      @credit_card_charge = CreditCardCharge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def credit_card_charge_params
      params.require(:credit_card_charge).permit(:paid, :amount, :currency, :refunded, :customer_id)
    end
end
