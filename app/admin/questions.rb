ActiveAdmin.register Question do

  scope :all
  scope :current_period_questions, default: true

  filter :period

  form do |f|
    f.inputs "Add a question for " + current_period.name + "gi" do
      f.input :content
      f.input :answer_type
    end
    f.actions
  end

  index do 
    column :content
    column :answer_type
    actions

  end

  controller do

    def create
      unless current_period
        flash[:alert] = "Not an Application period"
        redirect_to admin_root_path
      end

      @question = Question.new(params[:question])
      @question.period = current_period
      if @question.save
        redirect_to admin_questions_path, notice: "Question Successfully Added"
      else
        render :new
      end
    end

  end

end
