class PatientsController < ApplicationController
before_action :find_patient, only: [:show, :edit, :update, :destroy]
	
#display all the patients name in the index
	def index 
		@patients = Patient.all.order("created_at DESC") 
	end

	def index
	if params[:hospital].blank? 
      @patients = Patient.all.order("created_at DESC")
    else
      @hospital_id = Hospital.find_by(name: params[:hospital]).id
      @patients = Patient.where(:hospital_id => @hospital_id).order("created_at DESC")
    end
	end


	def show
	end


	# when we create a new patient 
	def new 
		@patient = current_user.patients.build
		@hospitals = Hospital.all.map{ |c| [c.name, c.id] }
	end

	# smae a new patient but will accept the params 
	def create
    @patient = current_user.patients.build (patient_params)
    @patient.hospital_id = params[:hospital_id] 

    if @patient.save
      redirect_to root_path
    else
      render 'new'
    end
  end
	def edit
		@hospitals = Hospital.all.map{ |c| [c.name, c.id] }
	end

	def update
		@patient.hospital_id = params[:hospital_id]  
		if @patient.update(patient_params)
			redirect_to patient_path(@patient)
		else
			render 'edit'
		end
	end

	def destroy
		@patient.destroy
		redirect_to root_path
	end

	private 
		# patietns params-  when a user fills the  form 
		def patient_params
			params.require(:patient).permit(:name, :dob, :address, :phone, :hospital_id)
		end

		def find_patient
			@patient = Patient.find(params[:id])
		end

end
