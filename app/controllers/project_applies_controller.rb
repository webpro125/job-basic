class ProjectAppliesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project, only:[:new, :create]

  def index
    @project_applies = current_user.project_applies
  end

  def new
    @project_apply = @project.project_applies.build
  end

  def create
    @project_apply = @project.project_applies.build(project_apply_params)
    @project_apply.user_id = current_user.id

    if @project_apply.save
      redirect_to project_applies_path, notice: 'You applied to job successfully'
    else
      render :new
    end
  end

  private

  def load_project
    @project = Project.friendly.find(params[:project_id])
  end

  def project_apply_params
    params.require(:project_apply).permit(:description)
  end
end
