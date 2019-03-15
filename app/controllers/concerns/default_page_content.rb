module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = 'Erica Bista | My Portfolio'
		@seo_keywords = 'erica bista portfolio'
	end
end