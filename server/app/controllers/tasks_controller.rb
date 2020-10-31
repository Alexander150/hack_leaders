class TasksController < ApplicationController
	def check
		File.open('./file.py', 'w+'){|f| f.write('print(1)')}
	end
end
