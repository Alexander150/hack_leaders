<script>
	import Menu from '../../components/Menu.svelte';
	import { getContext } from 'svelte';
	let headers = getContext('std_headers');
	import { tokenizeHeaders } from '../../helpers/user.helper.js';
	headers = tokenizeHeaders(headers);

	let task = {
		title: "",
		legend: "",
		description: ""
	};
	let tests = [
		{
			inputs: "",
			outputs: ""
		},
	];
	let error = "";
	async function createTask(){
		if ((task.title == "") && (task.description == "")){
			error = "Заполните поля со звездочкой";
			return 
		}
		let response = await fetch("http://localhost:3000/tasks/create", {
			method: "POST",
			headers: headers,
			body: JSON.stringify({task: task, tests: tests})
		});
		let answer = await response.json();
		error = answer.status;
	}
	function createTest(){
		tests = [...tests, {inputs: "", outputs: ""}]
	}

</script>
<div class="teacher-container">
<Menu />
	<div>
		<div class="tasks__creator">
			<label>Название задачи*</label>
			<input type="text" class="name" bind:value={task.title}>
			<label>Легенда задачи</label>
			<input type="text" class="legend" bind:value={task.legend}>
			<label>Условие задачи*</label>
			<input type="text" class="description" bind:value={task.description}>
		</div>
		{#each tests as test}
			<div class="tasks__checker">
				<label> Выходные данные:</label>
				<input type="text" class="input" bind:value={test.inputs}>
				<label> Выходные данные:</label>
				<input type="text" class="output" bind:value={test.outputs}>
			</div>
		{/each}	
		<button on:click={createTest}>Создать новый тест</button>	
		<button on:click={createTask}>Создать</button>	
		{error}		
	</div>
</div>
<style type="text/css">
	.teacher-container{
		display: grid;
		grid-template-columns: 120px 1fr;
		height: 100vh;
	}
	input{
		size: 40;
	}
	.tasks__checker{
		display: flex;
	}
</style>