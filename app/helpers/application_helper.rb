module ApplicationHelper

	#allow login anywhere in the app
	def resource_name
    :user
  end

	def resource
  	@resource ||= User.new
	end

	def devise_mapping
  	@devise_mapping ||= Devise.mappings[:user]
	end

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end
end
