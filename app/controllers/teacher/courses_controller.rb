class Teacher::CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_course, only: [:destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id

    if @course.save!
      redirect_to teacher_courses_path, notice: "Course Created."
    else
      render :new
    end
  end

  def destroy
    @course.destroy
  end

  private

    def course_params
      params.require(:course).permit(:name, :goal, :needs, :description)
    end

    def find_course
      @course = Course.find(params[:id])
    end
end
