class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @post = Post.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:section_id])
    @post = Post.new(post_params)

    @post.course_id = @course.id
    @post.section_id = @section.id
    @post.creator_id = current_user.id

    if @post.save
      redirect_to syllabus_course_path(@course), notice: "Post Created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to posts_path, notice: "Post Updated."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:title, :course_id, :creator_id, :content, :section_id)
    end
end
