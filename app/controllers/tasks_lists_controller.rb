class TasksListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tasks_list, only: %i[show edit update destroy]

  def index
    @tasks_lists = current_user.tasks_lists
  end

  def show
    @tasks = @tasks_list.tasks
    @user_creator = @tasks_list.user
  end

  def new
    @tasks_list = current_user.tasks_lists.build
    @tasks_list.tasks.build
  end

  def create
    @tasks_list = current_user.tasks_lists.build(tasks_list_params)
    @tasks_list.tasks.each do |task|
      task.is_done = false unless task.is_done.present?
    end

    if @tasks_list.save
      redirect_to tasks_lists_path, notice: 'Lista creada exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    puts "LALALALLALA": params
    @tasks_list = TasksList.find(params[:id])

    if params[:tasks]
      params[:tasks].each do |task_id, task_attributes|
        task = @tasks_list.tasks.find(task_id)
        task.update(is_done: task_attributes[:is_done])
      end
    end

    if @tasks_list.update(tasks_list_params)
      redirect_to tasks_list_path(@tasks_list), notice: 'Tasks List and associated tasks updated successfully.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tasks_list.destroy
    redirect_to tasks_lists_path, notice: 'Lista eliminada exitosamente.'
  end

  private

  def set_tasks_list
    @tasks_list = current_user.tasks_lists.find(params[:id])
  end

  def tasks_list_params
    params.require(:tasks_list).permit(:name, tasks_attributes: [:title, :description, :is_done, :_destroy])
  end

end
