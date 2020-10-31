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
		<p>ЗЗад ачаЗа д чаЗад ачаЗад а ч а За дачаЗада чаЗа дачаЗада аЗадач аЗадач аЗада чаЗадач аvЗадачаЗада чаЗадачаЗаЗад  чаЗ дача адачаЗа    </p>
	</div>   
	<div class="solution"> 
		<div class="solution__codemirror">
			<textarea class="solution__text" bind:value={code}></textarea>
		</div>
    <button on:click={sendCode}>Отправить</button>
		<div class="solution__test">
			<textarea class="solution__text"></textarea>
		</div>
	 </div>
</section>
 <style>
  .student__task {
  	display: grid;
  	grid-template-areas: 
  	"task solution";
  	grid-template-columns: 1fr 1fr;
  }
  .task{
  	grid-area: "task";
  	text-align: center;
  }
  textarea {
  	resize: none;
  	width: 95%;
  	height: 400px;
  }
  .task p{
  	
  }
  .task h1{

  }
   .solution{
  	grid-area: "solution";
  }
 </style>