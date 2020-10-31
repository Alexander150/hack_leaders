class TasksController < ApplicationController
	def check
		file = File.open('tmp/code.py', 'w+')
		file.print(params[:code])
		file.close
		file1 = File.open('tmp/output.txt', 'w+')
		file1.print(`python3 tmp/code.py `)
		file1.close
	end
end
