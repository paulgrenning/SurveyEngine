class SurveysController < ApplicationController

  def show
    @title = "Surveys"
    @survey = Survey.find(0)
    @questions = @survey.questions
  end

  def questions
    @survey = Survey.find(params[:question][:surveyid])
    @question = @survey.questions.new(params[:question]).save
    redirect_to  surveyedit_path(:id => params[:question][:surveyid])
  end

  def updatequestion
    Question.find(params[:questionid]).update_attributes(:content => params[:content])
    redirect_to  surveyedit_path(:id => params[:id])
  end

  def deletequestion
    Question.delete(params[:questionid])
    redirect_to  surveyedit_path(:id => params[:id])
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

  def delete
    Survey.delete(params[:id])
    redirect_to '/'
  end

  def surveyadmin
    @title = "Administration Page"
    @survey = Survey.find(params[:id])
  end

  def surveyinfo
    @title = "Survey Information"
    @survey = Survey.find(params[:id])
  end

  def surveyedit
    @title = "Edit Survey Questions"
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @question = Question.new(params[:question])
  end

  def surveyresults
    @title = "Survey Results"
  end

  def takesurvey
    @title = "Take Survey"
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
  end

end
