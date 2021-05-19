class AppointmentsController < ApplicationController

    def index
        appts = Appointment.all
        render json: AppointmentsSerializer.new(appts)
    end

    def create
        appt = Appointment.new
        appt.date = "#{params[:month]}/#{params[:day]}/#{params[:year]}"
        appt.time = params[:time]
        appt.daypart = params[:daypart]
        appt.length_time = params[:duration]
        appt.project_id = params[:project_id]
        appt.user_id = params[:user_id]
        appt.save
        
        render json: AppointmentsSerializer.new(appt)
    end
end
