class ProjectsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @projects = Project.all
  end
  def new
    @project = current_admin.projects.build
  end

  def create
    @project = current_admin.projects.build(project_params)
    if @project.save
      redirect_to projects_path, notice: 'You posted Project successfully'
    else render :new
    end
  end

  def show
    @project = Project.friendly.find(params[:id])
    puts @project
  end

  private

  def project_params
    params.require(:project).permit( :slug, :admin_id, :title, :company_name, :description, :category)
  end
end
