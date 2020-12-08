class SalonsController < ApplicationController
  before_action :set_salon, only: [:show, :edit, :update, :destroy]

  # GET /salons
  # GET /salons.json
  def index
    @salons = Salon.search(params[:search])
  end

  # GET /salons/1
  # GET /salons/1.json
  def show
  end

  # GET /salons/new
  def new
    @salon = Salon.new
  end

  # GET /salons/1/edit
  def edit
  end

  # POST /salons
  # POST /salons.json
  def create
    @salon = Salon.new(salon_params)
    @salon.image.attach(salon_params[:image])

    respond_to do |format|
      if @salon.save
        format.html { redirect_to @salon, notice: '新規サロン登録されました。' }
        format.json { render :show, status: :created, location: @salon }
      else
        format.html { render :new }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salons/1
  # PATCH/PUT /salons/1.json
  def update
    @salon.image.purge
    @salon.image.attach(salon_params[:image])

    respond_to do |format|
      if @salon.update(salon_params)
        format.html { redirect_to @salon, notice: 'サロン情報の編集しました。' }
        format.json { render :show, status: :ok, location: @salon }
      else
        format.html { render :edit }
        format.json { render json: @salon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salons/1
  # DELETE /salons/1.json
  def destroy
    @salon.destroy
    respond_to do |format|
      format.html { redirect_to salons_url, notice: 'サロン情報を削除しました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_salon
      @salon = Salon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def salon_params
      params.require(:salon).permit(:name, :address, :phone, :comment, :tokio, :ie, :design, :straight, :image)
    end
end
