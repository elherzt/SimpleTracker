class ProjectsController < ApplicationController
 before_action :authenticate_user!
  def index
     @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)
  end

  private
  def project_params
      params.require(:project).permit(:name, :description)
  end

end
