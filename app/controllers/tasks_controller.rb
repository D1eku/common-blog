class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Task not found"
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to @task
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, alert: "Task deleted"
  end

  private
  def task_params
    params.require(:task).permit(:title, :description, :is_done)
  end

end
