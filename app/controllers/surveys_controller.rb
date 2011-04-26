class SurveysController < ApplicationController


  def saveresults
    @survey = Survey.find(params[:id])
    @answersString = params[:answers].to_s
    @answers = params[:answers].to_s.split('x')
    @questions = @survey.questions
    @questions.each do |question|
      currentanswer = @answers.shift
      currentanswer = currentanswer.to_i
      question.questionresults.new(:answer => currentanswer).save
    end
    redirect_to surveyresults_path(:id => params[:id])
  end

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
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @numQuestions = @questions.length
    @hasQuestions = false
    if(@numQuestions != 0)
      @hasQuestions = true
      @averageAnswers = Array.new(@numQuestions)
      @total = 0
      @count = 0
      @hasResults = false
      if(@questions[0].questionresults.length != 0)
        @hasResults = true
        @totalSubmissions = @questions[0].questionresults.length
        @questions.each do |q|
          @total = 0
          q.questionresults.each do |r|
            @total = @total + r.answer.to_i
          end
          @averageAnswers[@count] = @total/@totalSubmissions * 135
          @count = @count + 1
        end
      end
    end
  end

  def takesurvey
    @title = "Taking A Survey"
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
    @questionresult = "" 
  end

end
