class Teacher::CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def syllabus
    @course = Course.find(params[:course_id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id

    if @course.save
      redirect_to teacher_courses_path, notice: "Course Created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to teacher_courses_path, notice: "Course Updated."
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:warning] = "Course Deleted."
    redirect_to teacher_courses_path
  end

  private

    def course_params
      params.require(:course).permit(:name, :goal, :needs, :description)
    end

    def find_course
      @course = Course.find(params[:id])
    end
end
