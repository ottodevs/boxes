class DevicesController < ApplicationController

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def edit
    @device = Device.find(params[:id])
  end

  def create
    @device = Device.new(device_params)
    if @device.save
      flash[:success] = "Device added"
      redirect_to @device
    else
      render 'new'
    end
  end

  def update
    @device = Device.find(params[:id])
    if @device.update_attributes(device_params)
      flash[:success] = "#{@device.name} saved"
      redirect_to @device
    else
      render 'edit'
    end
  end

  def destroy
    Device.find(params[:id]).destroy
    flash[:warning] = "Device deleted"
    redirect_back(fallback_location: devices_url)
  end

  private

  def device_params
    params.require(:device).permit(:name, :devtype, :model, :state, :ip,
                                   :location, :sn, :site_id)
  end

end
