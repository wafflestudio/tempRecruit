ActiveAdmin.register Applicant do


  # Block the admin to edit or destroy the application
  actions :all, :except => [:edit, :destroy, :new]

  filter :name
  filter :email
  filter :period

  scope :all
  scope :in_progress
  scope :complete
  scope :current_period, :default => true

#  sidebar :applicant_stats, :partial => "admin_views/stats"

  index do
    column("State") {|applicant| status_tag(applicant.status)  }
    column("Name") {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
    column :university
    column :department
    column :email
  end

  ### Create a button to change the state of the applicant at the show page
  action_item :only => :show do
    link_to "Check as complete", change_applicant_status_path(resource)
  end

  action_item :only => :show do
    link_to "Back to Applicants", admin_applicants_path
  end


  show do |ad|
    @current_applicant = Applicant.find(params[:id])

    columns do
      column do
        attributes_table do
          row :name
          row :email
          row :cell_phone
          row :university
          row :department
          row :year
          row :created_at
          row :status
        end
      end
      column span: 2 do
        render 'answers', context: self
      end
    end


    active_admin_comments
  end



end



