class Teacher::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_post, only: [:edit, :update, :destroy]

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

  private

    def post_params
      params.require(:post).permit(:name, :content)
    end

end
