class AppointmentsController < ApplicationController

    def index
        appts = Appointment.all
        render json: AppointmentsSerializer.new(appts)
    end
end
