module ApplicantsHelper
  
  def answer_field(builder, type, name)

    if (type == "textfield")
      builder.text_field name
    elsif (type == "textarea")
      builder.text_area name
    end
  end



end
