class ProjectController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.js
      else
        format.json { render json: @project.errors.messages, status: :unprocessable_entity }
      end
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
