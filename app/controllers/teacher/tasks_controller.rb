class Teacher::TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def show
    @post = @task.post
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @post = Post.find(params[:task][:post_id])

    if @task.save
      redirect_to teacher_post_path(@post), notice: "Task Created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post = @task.post

    if @task.update(task_params) 
      redirect_to teacher_post_path(@post), notice: "Task Updated."
    else
      render :edit
    end
  end

  def destroy
    @post = @task.post
    @task.post_id = @post.id

    @task.destroy
    redirect_to teacher_post_path(@post)
    flash[:warning] = "Task Deleted."
  end

  private
    
    def task_params
      params.require(:task).permit(:name, :content, :post_id)
    end

    def find_task
      @task = Task.find(params[:id])
    end
end
