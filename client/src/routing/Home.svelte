<script>
	// import Logout from '../components/Logout.svelte';
	import Cookies from 'js-cookie';

	let logged = Cookies.get('token') ? true : false;

	function onLogout(event) {
		logged = false;
	}
</script>

<div class="home">
	<!-- {#if logged}
		<Logout on:logout={onLogout}/>
	{/if} -->
	<div class="ts-container">
		<a href="/login/teacher">
			<div class="teacher">
				<h1> Я учитель</h1>
				<h2> Создать тест, посмотреть результаты, изменить тест</h2>
			</div>
		</a>
		<a href="/login/student">
			<div class="student">
				<h1> Я ученик </h1>
				<h2> Пройти тест, посмотреть результаты</h2>
			</div>
		</a>
	</div>
</div>	
 <style type="text/css" media="screen">
 	a{
 		text-decoration: none;
 	}
 	.home{
 		width: 100vw;
 		height: 100vh;
 		background-image: url(../images/homeback.png);
 		background-size: cover;
 		background-position: center;
 		background-repeat: no-repeat;
 	}
 	.ts-container{
 		padding-top: 200px;
 		display: flex;
 		justify-content: center;
 	}
 	.ts-container .teacher{
 	 	margin: 10px;
 		width: 450px;
 		height:450px;
 		border: 3px solid white;
 		background: linear-gradient(136.82deg, rgba(61, 17, 104, 0.5) 2.35%, rgba(0, 0, 0, 0.265) 100%);
		border-radius: 20px;
 		text-align: center;
 		color: white;
 		border: 3px solid white;
 		transition-duration: .5s;
 		background-image: url(../images/teacher.svg);
 		background-position: 50% 28%;
 		background-repeat: no-repeat;
 	}
 	.ts-container .teacher:hover{
 		background-image: url(../images/hoverteacher.svg);
 		background-color: white;
 		background-position: 50% 28%;
 		background-repeat: no-repeat;
 		color: #373B53;
 	}
 	.ts-container .teacher h1 {
 		margin: 0;
 		font-size: 30px;
 		padding: 225px 0 25px;
 	}
 	.ts-container .teacher h2 {
 		max-width: 250px;
 		margin: 0 auto;
 		font-size: 20px;
 	}
 	.ts-container .student{
 	 	margin: 10px;
 		width: 450px;
 		height:450px;
 		border: 3px solid white;
 		background: linear-gradient(136.82deg, rgba(61, 17, 104, 0.5) 2.35%, rgba(0, 0, 0, 0.265) 100%);
		border-radius: 20px;
 		text-align: center;
 		color: white;
 		border: 3px solid white;
 		transition-duration: .5s;
 		background-image: url(../images/student.svg);
 		background-position: 50% 28%;
 		background-repeat: no-repeat;
 	}
 	.ts-container .student:hover{
 		background-image: url(../images/hoverstudent.svg);
 		background-color: white;
 		background-position: 50% 28%;
 		background-repeat: no-repeat;
 		color: #373B53;
 	}
 	.ts-container .student h1 {
 		margin: 0;
 		font-size: 30px;
 		padding:225px 0 25px;
 	}
 	.ts-container .student h2 {
 		max-width: 250px;
 		margin: 0 auto;
 		font-size: 20px;
 	}
</style>