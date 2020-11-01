class TestsController < ApplicationController
	def get_tests
		@tests = Test.find_by(task_id: params[:id])
		render json: {tests: @tests}
	end
end
