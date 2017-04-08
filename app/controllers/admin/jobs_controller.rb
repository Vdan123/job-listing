class Admin::JobsController < ApplicationController
    before_action :authenticate_user, only: [:new, :create, :destroy, :edit, :update]

    def index
        @jobs = Job.all
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        if @job.save
            redirect_to jobs_path
        else
            render :new
        end
    end

    def update
        @job = Job.find(params[:id])
        if @job.update(job_params)
            redirect_to jobs_path
        else
            render :edit
        end
    end

    def edit
        @job = Job.find(params[:id])
    end

    def show
        @job = Job.find(params[:id])
    end

    def destroy
        @job = Job.find(params[:id])
        @job.destroy
        redirect_to jobs_path
    end

    private

    def job_params
        params.require(:jobs).permit(:new, :create, :eidt, :update, :destroy, :show)
    end
end
