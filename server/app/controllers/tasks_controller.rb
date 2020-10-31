class TasksController < ApplicationController
	def check
		file = File.open('tmp/their_code.py', 'w')
		file.print(params[:code])
		file.close

		f = File.open('tmp/ours_code.py', 'w')
		f.print('')
		f = File.open('tmp/ours_code.py', 'a')
		f.print("from their_code import f\n")
		@task = Task.find(2)
		@tests = Test.where(task_id: @task.id)
		@tests.each do |t|
			input = t.inputs
			f.print("print(f("+input+"))\n")
		end
		f.close()

		answer = `python3 tmp/ours_code.py`
		answer_arr = answer.split("\n")
		@tests.each_with_index do |t, i|
			if t.outputs == answer_arr[i]
				p true
			else
				p false
			end
		end

		# a = `python3 tmp/ours_code.py`
		# if a == 40
		# 	print a
		# end
	end
end
