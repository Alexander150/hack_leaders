<script>
  import Logout from '../../components/Logout.svelte';
  import {onMount} from 'svelte';
  import { getContext } from 'svelte';
  let headers = getContext('std_headers');
  import { tokenizeHeaders } from '../../helpers/user.helper.js';
  headers = tokenizeHeaders(headers);
  export let params;

  let task = {
    title: "",
    legend: "",
    description: "",
    start_point: ""
  };

  let parameters = {
    code: task.start_point,
    task_id: params.id,
  }

  onMount(async () => {
    let response = await fetch("http://localhost:3000/tasks/" + params.id, {
      method: "GET",
      headers: headers
    });
    let answer = await response.json();
    task = answer.task;
    parameters.code = task.start_point;
  });

  let answers;

  async function sendCode(){
    let response = await fetch("http://localhost:3000/tasks/check", {
      method: "POST",
      headers: headers,
      body: JSON.stringify(parameters)
    });
    answers = await response.json();
    answers = answers.answers.join(";\n");
  }


</script>
<div class="coderoom">
  <Logout/>
	<div class="student__task">	
		<div class="task">
			<h1>{task.title}</h1>
      {#if task.legend}
        <div>{task.legend}</div> <!-- РАСИМ ПОПРАВЬ ЛЕГЕНДУ, ЧТОБЫ ОНА БЫЛА ДО ОПИСАНИЯ -->
      {/if}
			<div class="task__description">{task.description}</div>
		</div>   
		<div class="solution"> 
			<div class="solution__codemirror">
				<label> Мое решение:</label>
				<textarea class="solution__text" bind:value={parameters.code}></textarea>
			</div>
	    <button on:click={sendCode}>Отправить</button>
			<div class="solution__test">
				<label> Проверка:</label>
				<textarea class="solution__text" bind:value={answers}></textarea>
			</div>
			<div class="solution__buttonbar">
				
			</div>
		 </div>
	</div>
</div>	
 <style>
 *{box-sizing: border-box;}
 .coderoom{
 	background-color: black;
 	width: 100vw;
 	height: 100vh;
 	background-image: url(../images/studentcoderoom.png);
 	background-size: cover;
 	background-position: center;
 	background-repeat: no-repeat;
 }
  .student__task{
  	height: 100%;
  	width: 100%;
  	display: grid;
  	grid-template-areas: 
  	"task solution";
  	grid-template-columns: 1fr 1fr;
  }
  .task{
  	grid-area: "task";
  	width: 95%;
  	margin: 0 auto;
  }
  .solution {
  	width: 95%;
  }
  .solution__test textarea {
  	color: white;
  	border: 3px solid #F1F4F7;
  	border-radius: 5px;
  	background: #2C2C2C;
  	resize: none;
  	width: 100%;
  	height: 300px;
  	margin: 10px 0;
  }
  .solution label{
  	color: white;
   	font-size:20px;
   	margin-top:calc(40px - 10px + 5px - 1em);
  }
  .solution__codemirror textarea {
  	color: white;
  	border-radius: 5px;
  	background: #2C2C2C;
  	border: 3px solid #F1F4F7;
  	resize: none;
  	width: 100%;
  	height: 400px;
  	margin: 10px 0;
  }
  .task__description{
  	color: white;
  	border: 3px solid #F1F4F7;
  	text-align: left;
  	height: 100%;
  	max-height: 810px;
  	border-radius: 5px;
  	background: #2C2C2C;
  	padding: 40px;
  }
  .task h1{
  	color: white;
  	margin: 0;
  	font-size: 40px;
  }
   .solution{
  	grid-area: "solution";
  }
 </style>