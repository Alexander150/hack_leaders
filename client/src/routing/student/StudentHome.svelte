<script>
  let code;

  function sendCode(){
    fetch("http://localhost:3000/tasks/check?code=" + code)
    .then(r => r)
    .then(r => console.log("true"))
  }
</script>
<div class="coderoom">
	<div class="student__task">	
		<div class="task">
			<h1>Задача</h1>
			<div class="task__description">Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи Текст задачи 	Текст задачи Текст задачи Текст задачи  </div>
		</div>   
		<div class="solution"> 
			<div class="solution__codemirror">
				<label> Мое решение:</label>
				<textarea class="solution__text" bind:value={code}></textarea>
			</div>
	    <button on:click={sendCode}>Отправить</button>
			<div class="solution__test">
				<label> Проверка:</label>
				<textarea class="solution__text"></textarea>
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
  	border-radius: 5px;
  	background: #EFEFEF;
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
  	border-radius: 5px;
  	background: #EFEFEF;
  	resize: none;
  	width: 100%;
  	height: 400px;
  	margin: 10px 0;
  }
  .task__description{
  	text-align: left;
  	height: 100%;
  	max-height: 810px;
  	border-radius: 5px;
  	background: #EFEFEF;
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