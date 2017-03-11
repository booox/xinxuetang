class CoursesController < ApplicationController
  layout "syllabus"

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def syllabus
    @course = Course.find(params[:id])
    @sections = Section.where("course_id = ?", @course.id)
    # @sections = Section.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.creator_id = current_user.id

    if @course.save
      redirect_to courses_path, notice: "Course Created."
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to course_path, notice: "Course Update"
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destory
    redirect_to courses_path
  end



  private

    def course_params
      params.require(:course).permit(:name, :goal, :needs, :description, :hint)
    end
end
