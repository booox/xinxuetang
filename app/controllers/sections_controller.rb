class SectionsController < ApplicationController
  def new
    # course = Course.find(params[:course_id])
    # @section = course.sections.build
    @course = Course.find(params[:course_id])
    @section = Section.new
  end

  def create
    @course = Course.find(params[:course_id])
    @section = Section.new(section_params)

    @section.course_id = @course.id
    @section.creator_id = current_user.id

    if @section.save
      redirect_to syllabus_course_path(@course), notice: "Section Created."
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])

    if @section.update(section_params)
      redirect_to syllabus_course_path(@course), notice: "Section Updated."
    else
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @section = Section.find(params[:id])

    @section.destroy
    redirect_to syllabus_course_path(@course)
  end


  private

    def section_params
      params.require(:section).permit(:name)
    end
end
