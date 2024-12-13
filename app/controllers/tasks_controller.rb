class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tasks_list
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = @tasks_list.tasks.build
  end

  def show
    @task = Task.find(params[:id])
    @comments = @task.comments
  end

  def create
    @task = @tasks_list.tasks.build(task_params)
    if @task.save
      redirect_to tasks_list_path(@tasks_list), notice: 'Tarea creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #@task = Task.find(params[:id])
    #rescue ActiveRecord::RecordNotFound
    #redirect_to root_path, alert: "Task not found"
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_list_path(@tasks_list), notice: 'Tarea actualizada exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_list_path(@tasks_list), alert: "Task deleted"
  end

  private
  def set_tasks_list
    @tasks_list = current_user.tasks_lists.find(params[:tasks_list_id])
  end

  def set_task
    @task = @tasks_list.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end

end
