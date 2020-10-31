class TasksController < ApplicationController
	def check
		file = File.open('code.py', 'w+')
		file.write(params[:code])
		file.close
		file1 = File.open('output.txt', 'w+')
		file1.write(system('python3 code.py'))
		file1.close
	end
end
