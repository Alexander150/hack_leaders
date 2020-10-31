class TasksController < ApplicationController
	def check
		file = File.open('tmp/their_code.py', 'w')
		file.print(params[:code])
		file.close

		f = File.open('tmp/ours_code.py', 'w')
		f.print('')
		f = File.open('tmp/ours_code.py', 'a')
		f.print("from their_code import f\n")
		input = "5, 8"
		f.print("print(f("+input+"))\n")
		f.close()

		# file1 = File.open('tmp/output.txt', 'w')
		# file1.print(`python3 tmp/ours_code.py `)
		a = `python3 tmp/ours_code.py `
		if a == 40
			print a
		end
		# file1.close
	end
end
