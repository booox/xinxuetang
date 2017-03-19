class Teacher::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @section = Section.find(params[:post][:section_id])
    @post.section_id = @section.id
    @course = @section.course

    if @post.save
      redirect_to teacher_course_syllabus_path(@course), notice: "Post Created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course = @post.section.course

    if @post.update(post_params)
      redirect_to teacher_course_syllabus_path(@course), notice: "Post Updated."
    else
      render :edit
    end
  end

  def destroy
    @course = @post.section.course

    @post.destroy
    flash[:warning] = "Post Deleted."
    redirect_to teacher_course_syllabus_path(@course)
  end

  private

    def post_params
      params.require(:post).permit(:name, :content)
    end

    def find_post
      @post = Post.find(params[:id])
    end

end
