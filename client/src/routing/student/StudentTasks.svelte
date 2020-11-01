<script>
  // import Logout from '../../components/Logout.svelte';
  import Menu from '../../components/Menu.svelte';
  import {onMount} from 'svelte';
  import { getContext } from 'svelte';
  let headers = getContext('std_headers');
  import { tokenizeHeaders } from '../../helpers/user.helper.js';
  headers = tokenizeHeaders(headers);

  let tasks = [];

  onMount(async () => {
    let response = await fetch("http://localhost:3000/tasks", {
      method: "GET",
      headers: headers
    });
    let answer = await response.json();
    tasks = answer.tasks;
  });
</script>
<Menu />
<section class="student-tasks">
	<div class="my-tasks">
		<h1>Мои задачи</h1>
		<div class="my-tasks__list">
			{#each tasks as task}
				<div class="list__task">
					<div class="task__about">
						<h2>{task.title}</h2>
						<h3>{task.description}</h3>	
					</div>
					<a href="/student/tasks/{task.id}" class="task__button">Выполнить</a>
				</div>
			{/each}
		</div>
	</div>
</section>
<style>
	.student-tasks{
		padding: 100px 0;
 		width: 100vw;
 		height: 100vh;
 		background-image: url(../images/tasksback.png);
 		background-size: cover;
 		background-position: center;
 		background-repeat: no-repeat;
	}
	.my-tasks{
		max-width: 750px;
		margin: 0 auto;
		padding: 40px;
		border-radius: 3px;
	}
	.my-tasks h1{
		margin-bottom:16px;
		font-size: 30px;
		color: #373B53;
	}
	.my-tasks h1::after{
	  content: '';
	  margin-top: 10px;
      display: block;
      height: 1px;
      width: 420px;
      background: #CDBBDF;
	}
	.list__task{
		display: flex;
		justify-content: space-between;
		color: #373B53;
		background: white;
		border: 3px solid #F1F4F7;
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
		border-radius: 20px;
		max-width: 750px;
		height: 100%;
		margin: 8px 0;
	}
	.task__about h2{
		font-weight: 100;
		margin: 0;
		padding: 9px 12px 1px;
		font-size: 18px;
	}
	.task__about h3{
		margin: 0;
		font-weight: 500;
		font-size: 23px;
		padding:0 12px 12px;
	}
	.task__button {
		font-size: 14px;
		text-decoration: none;
		text-align: center;
		margin: auto 40px;
		padding-top: 2px ;
		color: #373B53;
		background: white;
		border-radius: 10px;
		width: 100%;
		max-width: 180px;
		height: 25px;
	}
</style>