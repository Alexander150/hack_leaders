class TasksController < ApplicationController
	def check
		file = File.open('tmp/their_code.py', 'w')
		file.print(params[:code])
		file.close

		f = File.open('tmp/ours_code.py', 'w')
		f.print('')
		f = File.open('tmp/ours_code.py', 'a')
		f.print("from their_code import f\n")
		f.print("arr = [1, 2, 3]\n")
		f.print("print(f(arr))\n")
		f.close()

		file1 = File.open('tmp/output.txt', 'w')
		file1.print(`python3 tmp/ours_code.py `)
		file1.close
	end
end
