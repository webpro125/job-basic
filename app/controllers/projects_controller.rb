class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: [:search]
  before_action :authenticate_user!, only: [:search]

  def index
    @projects = Project.all
  end
  def new
    @project = current_admin.projects.build
  end

  def create
    @project = current_admin.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: 'You posted Project successfully!'
    else render :new
    end
  end

  def show
    @project = Project.friendly.find(params[:id])
    puts @project
  end

  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path, notice: 'You deleted successfully!'
  end

  private

  def project_params
    params.require(:project).permit( :slug, :start_date, :end_date, :admin_id, :title, :company_name, :description, :category)
  end
end
