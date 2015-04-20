class AppointmentImportsController < ApplicationController
  before_action :set_appointment_import, only: [:show, :edit, :update, :destroy]

  def search
    @appointment_imports = AppointmentImport.where('start_time like ?', "%#{params[:search_query]}%")
    render template: 'appointment_imports/index'

  end
  def index
    @appointment_imports = AppointmentImport.all
  end


  def show
  end

  def new
    @appointment_import = AppointmentImport.new
  end

  def edit
  end


  def create
    @appointment_import = AppointmentImport.new(appointment_import_params)

    respond_to do |format|
      if @appointment_import.save
        format.html { redirect_to @appointment_import, notice: 'Appointment import was successfully created.' }
        format.json { render :show, status: :created, location: @appointment_import }
      else
        format.html { render :new }
        format.json { render json: @appointment_import.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    AppointmentImport.import(params[:file])
    redirect_to root_url, notice: 'Appointments imported.'
  end


  def update
    respond_to do |format|
      if @appointment_import.update(appointment_import_params)
        format.html { redirect_to @appointment_import, notice: 'Appointment import was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment_import }
      else
        format.html { render :edit }
        format.json { render json: @appointment_import.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment_import.destroy
    respond_to do |format|
      format.html { redirect_to appointment_imports_url, notice: 'Appointment import was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment_import
      @appointment_import = AppointmentImport.find(params[:id])
    end

    def appointment_import_params
      params.require(:appointment_import).permit(:start_date, :start_time, :end_date, :end_time, :first_name, :last_name, :comments)
    end
end
