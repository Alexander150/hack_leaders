class TasksController < ApplicationController
	def create
		@task = Task.create!(
			title: params[:title], 
			legend: params[:legend],
			description: params[:description]
		)
	end
end
