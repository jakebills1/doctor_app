class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :find_doctors
  def index
    @appointments = current_user.appointments
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = current_user.appointments.new(appt_params)
    if @appointment.save
      redirect_to appointments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appt_params)
      redirect_to appointments_path
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private
    def appt_params
      params.require(:appointment).permit(:name, :doctor_id)
    end

    def set_appointment
      @appointment = current_user.appointments.find(params[:id])
    end

    def find_doctors
      @doctors = Doctor.all
    end
end
