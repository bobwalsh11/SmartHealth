   class VisitsController < ApplicationController
   	before_action :find_patient
   	before_action :find_visit, only: [:edit, :update, :destroy]
	
	def new
		@visit = Visit.new
	end

	def create
		@visit = Visit.new(visit_params)
		@visit.patient_id = @patient.id
		@visit.user_id = current_user.id

		if@visit.save
			redirect_to patient_path(@patient)
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		@visit = Visit.find(params[:id])

		if @visit.update(visit_params)
			 redirect_to patient_path(@patient)
			 else
			 	render 'edit'
			 end
 	end


	def destroy
	
		@visit.destroy
		 redirect_to patient_path(@patient)
	end


	private

	def visit_params
		params.require(:visit).permit(:hospital, :department, :comment, :date)
	end

	def find_patient
		@patient = Patient.find(params[:patient_id])
	end

	def find_visit
		@visit = Visit.find(params[:id])
end

end