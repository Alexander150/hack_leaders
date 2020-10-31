class TasksController < ApplicationController

	def get_task
		@task = Task.find(params[:id])

		render json: {task: @task}
	end

	def get_tasks
		@tasks = Task.all.order(id: :asc)
		render json: {tasks: @tasks}
	end

	def check
		file = File.open('tmp/their_code.py', 'w')
		file.print(params[:code])
		file.close

		f = File.open('tmp/ours_code.py', 'w')
		f.print('')
		f = File.open('tmp/ours_code.py', 'a')
		f.print("from their_code import f\n")
		@task = Task.find(params[:task_id])
		@tests = Test.where(task_id: @task.id)
		@tests.order(id: :asc).each do |t|
			input = t.inputs
			f.print("print(f("+input+"))\n")
		end
		f.close()

		answer = `python3 tmp/ours_code.py`
		answer_arr = answer.split("\n")
		@tests.order(id: :asc).each_with_index do |t, i|
			if t.outputs == answer_arr[i]
				answer_arr[i] = "Test(f(" + t.inputs + "), " + t.outputs + ")"
			else
				answer_arr[i] = "Тест не пройден"
			end
		end
		render json: {answers: answer_arr}
	end
end
