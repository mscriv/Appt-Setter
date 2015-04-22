module Api
  module V1
    class AppointmentImportsController < ApplicationController
      respond_to :json

      def index
        respond_with AppointmentImport.all
      end

      def show
        respond_with AppointmentImport.find(params[:id])
      end

      def create
        respond_with AppointmentImport.create(params[:appointment_import])
      end

      def update
        respond_with AppointmentImport.update(params[:id], params[:appointment_import])
      end

      def destroy
        respond_with AppointmentImport.destroy(params[:id])
      end
    end
  end
end