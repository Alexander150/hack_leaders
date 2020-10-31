class TasksController < ApplicationController
	def check
		file = File.new('./file.py')
		file.print('print(1)')
		file.close
	end
end
