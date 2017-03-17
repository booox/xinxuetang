class AssignmentsController < ApplicationController

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    #@course = Course.find(params[:course_id])
    #@section = Section.find(params[:section_id])
    # @post = Post.find(params[:post_id])
    @assignment.post_id = @post.id

    if @assignment.save
      #redirect_to course_section_post_path(course, section, post), notice: "Assigmnet Created."
      redirect_to :back, notice: "Assigmnet Created."
    else
      render :new
    end
  end

  def edit
  end


  private

    def assignment_params
      params.require(:assignment).permit(:name)
    end
end
