<script>
 // import Logout from '../../components/Logout.svelte';
  import {onMount} from 'svelte';
  import { getContext } from 'svelte';
  let headers = getContext('std_headers');
  import { tokenizeHeaders } from '../../helpers/user.helper.js';
  headers = tokenizeHeaders(headers);
  export let params;
  let answers;
  let langs = [];

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
    let response2 = await fetch("http://localhost:3000/langs", {
      method: "GET",
      headers: headers
    });
    let answer = await response.json();
    let answer2 = await response2.json();
    task = answer.task;
    langs = answer2.langs;
    parameters.code = task.start_point;
    parameters.lang = langs[0].name;
  });

  function setLang(){
    let select = document.getElementById("lang");
    parameters.lang = select.value;
  }

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
  <!-- <Logout/> -->
	<div class="student__task">	
    <h1>Название темы</h1>
		<div class="task">
      <div class="task__header">
			   <h2>{task.title}</h2>
         <div class="task__timer" >Оставшееся время: <span>25:43</span></div>
      </div>
        {#if task.legend}
          <div class="task__legend">{task.legend}</div>
        {/if}
        <div class="task__description">{task.description}</div>
		</div>  
		<div class="solution"> 
			<div class="solution__codemirror">
        <div class="solution__header">
				  <h2>Решение</h2>
          <select id="lang" name="langs" on:change={setLang}>
            <option selected>Выберите язык</option>
              {#each langs as lang}
                <option value={lang.name}>{lang.name}</option>
              {/each}
          </select>
        </div>
				<textarea class="solution__text" bind:value={parameters.code}></textarea>
			</div>
      <div class="solution__result">
        <h2>Результат</h2>			
				<textarea class="solution__text" bind:value={answers}></textarea>
			   <div class="buttonsbar">       
          <button class="button-white" on:click={sendCode}>Тест</button>
          <button class="button-purple">Отправить</button>
        </div>

			</div>
		 </div>
	</div>
</div>	
 <style>
 *{box-sizing: border-box;}
 .coderoom{
 	width: 100vw;
 	height: 100vh;
 	background-image: url(../images/tasksback.png);
 	background-size: cover;
 	background-position: center;
 	background-repeat: no-repeat;
 }
  .student__task{
  	height: 100%;
  	width: 100%;
  	display: grid;
  	grid-template-rows: 1fr 1fr;
  }
  .solution__header{
    background-color: white;
    display: flex;
    justify-content: space-between;
  }
  .solution__header h2{
    color: #373B53;
    margin: 0;
    padding: 29px 0;
  }
  .task{
    color: #373B53;
  	width: 95%;
  	margin: 0 auto;
    border-radius: 10px;
    border: 3px solid #F1F4F7;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
    text-align: left;
    height: 100%;
    max-height: 810px;
    border-radius: 5px;
    padding: 40px;
  }
  .solution {
  	width: 95%;
    display: grid;
    grid-template-columns: 1fr 1fr;
  }
  .solution__result textarea {
    color: #373B53;
    border-radius: 10px;
    border: 3px solid #F1F4F7;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
  	resize: none;
  	width: 100%;
  	height: 300px;
  	margin: 15px 0;
  }
  .solution__result{
    background-color: white;
    margin-left: 40px;
  }
  .solution__result h2{
    font-weight: 800;
    color: #3D1168;
    font-size: 30px;
  }
  .solution label{
  	color: white;
   	font-size:20px;
   	margin-top:calc(40px - 10px + 5px - 1em);
  }
  .solution__codemirror textarea {
    color: #373B53;
    border-radius: 10px;
    border: 3px solid #F1F4F7;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
  	resize: none;
  	width: 100%;
  	height: 400px;
  	margin: 10px 0;
  }
  .solution__codemirror{
    margin-left: 35px; 
  }
  .task h2{
    color: #373B53;
  	margin: 0;
  	font-size: 30px;
  }
   .solution{
  }
  .task__legend{
    font-size: 20px;
    padding: 50px 0;
  }
  .task__description{
    font-size: 20px;
  }
  .task__header{
    font-size: 20px;
    display: flex;
    justify-content: space-between;
  }
  .solution__header select{
    border: none;
    color:#373B53;
    font-size: 20px;
    font-weight: 400;
  }
  .solution__header h2{
    font-weight: 800;
    color: #373B53;
    font-size: 30px;
  }
  .task__header span{
    color: #3D1168;
    font-weight: 800;
  }
  .student__task h1{
    color:#373B53;
    font-weight: 800;
    font-size: 40px;
    margin-left: 35px;
  }
  .button-white{
    align-self: center;
    text-align: center;
    background: white;
    margin: 0;
    padding: 16px 50px;
    color: #3D1168;
    font-size: 22px;
    line-height: 26px;
    text-align: center;
    border: 3px solid #3D1168;
    box-sizing: border-box;
    border-radius: 50px;
  }
  .button-purple{
    background: none;
    background:#3D1168;
    margin: 0;
    padding: 16px 50px;
    color: white;
    font-size: 22px;
    line-height: 26px;
    text-align: center;
    border: 3px solid white;
    box-sizing: border-box;
    border-radius: 50px;
  }
 </style>