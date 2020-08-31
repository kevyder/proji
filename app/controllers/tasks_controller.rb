class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: %i[create]

  def create
    @task = @project.tasks.create(tasks_params)
    redirect_to @project
  end

  def complete
    @task.update_attribute(:completed_at, Time.now) if @task.completed_at.nil?
    redirect_to @project, notice: "Task completed."
  end

  def destroy
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

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def tasks_params
    params[:task].permit(:content)
  end

end
