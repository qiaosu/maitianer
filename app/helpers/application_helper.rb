module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = t("maitianer")
    if @title.nil?
      base_title
    else
      "#{@title} | #{base_title}"
    end
  end
  
  def body_id
    @body_id
  end
  
  def body_classes
    @body_classes ||= [controller.controller_name]
  end
  
  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, notice, :class => "success") if notice
    msg << (content_tag :div, alert, :class => "alert") if alert
    sanitize msg
  end
  
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

end
