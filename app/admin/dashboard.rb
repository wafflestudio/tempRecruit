ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
#    div :class => "blank_slate_container", :id => "dashboard_default_message" do
#      span :class => "blank_slate" do
#        span I18n.t("active_admin.dashboard_welcome.welcome")
#        small I18n.t("active_admin.dashboard_welcome.call_to_action")
#      end
#    end

    columns do
      column do

        panel "Current Stats" do
          render '/admin_views/stats'
        end

        panel "Current Period" do
          if current_period
            div :class => "blank_slate_container", :id => "dashboard_default_message" do
              span :class => "blank_slate" do
                span "Ongoing Application Period for " + current_period.name + " gi"
                small current_period.start_date.to_s + " ~ " + current_period.due_date.to_s
              end
            end
            div :class => "blank_slate_container", :id => "dashboard_default_message" do
              span :class => "blank_slate" do
                link_to('End Current Period', end_current_period_path)
              end
            end
          else
            render 'admin_views/create_period'
          end
        end
      end

      column span: 2 do
        panel "Recent Applicants From Current Ongoing Period" do
          if !(Period.current_period.empty?)
            table_for Period.current_period.first.applicants.order('name desc').limit(20) do 
              column("State") {|applicant| status_tag(applicant.status)  }
              column("Name") {|applicant| link_to(applicant.name, admin_applicant_path(applicant)) }
              column :email
            end
          end
        end
      end

    end



    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
