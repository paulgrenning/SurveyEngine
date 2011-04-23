class SurveysController < ApplicationController

  def show
    @survey = Survey.find(0)
  end

  def new
    @title = "Surveys"
    @survey = Survey.new
    @surveys = Survey.all
  end

  def create
    @surveys = Survey.all
    @survey = Survey.new(params[:survey])
    @error = false
    if @survey.save
      @title = "Sign up"
      render 'new'
    else
      @error = true
      @title = "Sign up"
      render 'new'
    end
  end

end
