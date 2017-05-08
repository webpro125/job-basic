class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: [:search, :show]
  before_action :authenticate_user!, only: [:search]
  before_action :auth_a_user!, only: [:show]
  def index
    @projects = current_admin.projects.order(created_at: :desc)
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

  def search
    @q = Project.search(params[:q])
    @q.sorts = 'id asc' if @q.sorts.empty?
    # @cars = @q.result.page(params[:page]).per(5)
    @projects = @q.result if params[:q].present?
  end

  private

  def project_params
    params.require(:project).permit( :slug, :start_date, :end_date, :admin_id, :title, :company_name, :description, :category)
  end
end
