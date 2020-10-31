class TasksController < ApplicationController
	def check
		File.open("out.py", "w+") {|file| 
			file.write("print(2)")

		}
		'python out.py'

	end
end
