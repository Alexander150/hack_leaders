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

		mode = 'python'

		if mode == 'python'
			cmd = 'python3'
			postfix = '.py'
			import = "from their_code import f"

		elsif mode == 'ruby'
			cmd = 'ruby'
			postfix = '.rb'
			import = "require_relative \"their_code\"\ninclude TheirCode\n"

		end


		file = File.open('/tmp/their_code%s' % postfix, 'w')
		if mode == 'ruby'
			file.print('')
			file = File.open('/tmp/their_code%s' % postfix, 'a')
			file.print("module TheirCode\n")
		end
		file.print(params[:code])
		if mode == 'ruby'
			file.print("\nend")
		end
		file.close

		f = File.open('/tmp/ours_code%s' % postfix, 'w')
		f.print('')
		f = File.open('/tmp/ours_code%s' % postfix, 'a')
		f.print(import + "\n")
		@task = Task.find(params[:task_id])
		@tests = Test.where(task_id: @task.id)
		@tests.order(id: :asc).each do |t|
			input = t.inputs
			f.print("print(f(" + input + "))\n")
			f.print("print(\"\n\")\n") if mode == "ruby"
		end
		f.close()

		answer = `#{cmd} /tmp/ours_code#{postfix}`
		answer_arr = answer.split("\n")
		@tests.order(id: :asc).each_with_index do |t, i|
			puts answer_arr[i]
			if t.outputs == answer_arr[i]
				answer_arr[i] = "Test(f(" + t.inputs + "), " + t.outputs + ")"
			else
				answer_arr[i] = "Тест не пройден"
			end
		end
		render json: {answers: answer_arr}
	end
end
