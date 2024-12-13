class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new
  end
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)

    if @comment.save

      redirect_to @task, notice: "Comentario Agregado con Exito."
    else
      render :@task, status: :unprocessable_entity
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:creator, :task_id, :content)
  end
end
