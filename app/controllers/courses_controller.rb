class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def dashboard
    @courses = Course.all
  end
end
