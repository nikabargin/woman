module ApplicationHelper
	def title(page_title)
		content_for(:title) { page_title }
	end

	def meta_description(text)
    	content_for :"meta_description", text
  	end
end
