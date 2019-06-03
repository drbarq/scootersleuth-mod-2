class SpinsController < ApplicationController
  before_action :set_spin, only: [:show, :edit, :update, :destroy]

  def index
    @spins = Spin.all
  end

  def show
  end

  def new
    @spin = Spin.new
  end

  def edit
  end

  def create
    @spin = Spin.new(spin_params)

    respond_to do |format|
      if @spin.save
        format.html { redirect_to @spin, notice: 'Spin was successfully created.' }
        format.json { render :show, status: :created, location: @spin }
      else
        format.html { render :new }
        format.json { render json: @spin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @spin.update(spin_params)
        format.html { redirect_to @spin, notice: 'Spin was successfully updated.' }
        format.json { render :show, status: :ok, location: @spin }
      else
        format.html { render :edit }
        format.json { render json: @spin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spin.destroy
    respond_to do |format|
      format.html { redirect_to spins_url, notice: 'Spin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_spin
      @spin = Spin.find(params[:id])
    end

    def spin_params
      params.require(:spin).permit(:company, :latitude, :longitude, :battery_level)
    end
end
