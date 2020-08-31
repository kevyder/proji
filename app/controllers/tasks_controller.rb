class TasksController < ApplicationController
  before_action :set_project, only: %i[create update destroy]

  def create
    @task = @project.tasks.create(tasks_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task was not deleted."
    end

    redirect_to @project
  end


  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task; end

  def tasks_params
    params[:task].permit(:content)
  end

end
