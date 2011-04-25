class SurveysController < ApplicationController

  def show
    @title = "Surveys"
    @survey = Survey.find(0)
  end

  def new
    @title = "Surveys"
    @survey = Survey.new
    @surveys = Survey.all
  end

  def create
    @title = "Surveys"
    @surveys = Survey.all
    @survey = Survey.new(params[:survey])
    @error = false
    if @survey.save
      redirect_to '/'
    else
      @error = true
      render 'new'
    end
  end

  def surveyadmin
    @title = "Administration Page"
    @survey = Survey.find(params[:id])
  end

  def surveyinfo
    @title = "Survey Information"
    @survey = Survey.find(params[:id])
  end

  def surveyresults
    @title = "Survey Results"

  end

  def takesurvey
    @title = "Take Survey"

  end

end
