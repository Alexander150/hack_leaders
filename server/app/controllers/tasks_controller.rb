class TasksController < ApplicationController
	def check
		File.open("code.py", "w+") {|file| 
			file.write(params[:code])
		}
		File.open("out.txt", "w+") {|file|
			file.write("123")
			# file.write(system('python code.py'))
		}

	end
end
