class Teacher::SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_section, only: [:edit, :update, :destroy]

  def index
    # @sections = Section.all
  end

  def show
    # @section = Section.find(params[:section_id])
  end

  def new
    @section = Section.new
    # @course = Course.find(params[:course_id])
  end

  def create
    @section = Section.new(section_params)
    @course = Course.find(params[:section][:course_id])
    #@course = Course.find(params[:course_id])
    @section.course_id = @course.id

    if @section.save
      redirect_to teacher_course_syllabus_path(@course), notice: "Section Created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @course = @section.course
    if @section.update(section_params)
      redirect_to teacher_course_syllabus_path(@course), notice: "Section Updated."
    else
      render :edit
    end
  end

  def destroy
    @course = @section.course
    @section.destroy
    flash[:warning] = "Section Deleted."
    redirect_to teacher_course_syllabus_path(@course)
  end

  private

    def section_params
      params.require(:section).permit(:name)
    end

    def find_section
      @section = Section.find(params[:id])
    end

end
