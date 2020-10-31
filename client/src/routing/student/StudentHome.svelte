<section class="students-solution">	
<script>
  let code;

  function sendCode(){
    fetch("http://localhost:3000/tasks/check?code=" + code)
    .then(r => r)
    .then(r => console.log("true"))
  }
</script>
<section class="student__task">	
	<div class="task">
		<h1>Задача</h1>
		<div class="taks__description">Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи  </div>
	</div>   
	<div class="solution"> 
		<div class="solution__codemirror">
			<label> Мое решение:</label>
			<textarea class="solution__text"></textarea>
			<textarea class="solution__text" bind:value={code}></textarea>
		</div>
    <button on:click={sendCode}>Отправить</button>
		<div class="solution__test">
			<label> Проверка:</label>
			<textarea class="solution__text"></textarea>
		</div>
	 </div>
</section>
 <style>
  .students-solution{
  	display: grid;
  	grid-template-areas: 
  	"task solution";
  	grid-template-columns: 1fr 1fr;
  }
  .task{
  	grid-area: "task";
  	text-align: center;
  }
  .solution__test textarea {
  	resize: none;
  	width: 95%;
  	height: 400px;
  	margin: 10px;
  }
  .solution__codemirror textarea {
  	resize: none;
  	width: 95%;
  	height: 400px;
  	margin: 10px;
  }
  .task__description{
  	
  }
  .task h1{

  }
   .solution{
  	grid-area: "solution";
  }
 </style>