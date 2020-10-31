class LanguagesController < ApplicationController

	def get_languages
		@langs = Language.all.order(id: :asc)
		render json: {langs: @langs}
	end
end
