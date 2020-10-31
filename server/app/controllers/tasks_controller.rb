class TasksController < ApplicationController
	def check
		# File.open("code.py", "w+") {|file| 
		# 	file.write(params[:code])
		# }
		file = File.open('code.py', 'w+')
		file.write(params[:code])
		file.close
		file1 = File.open('output.txt', 'w+')
		# file1.write(system('python code.py'))
		file1.write(exec('python code.py'))
		file1.close
	end
end
