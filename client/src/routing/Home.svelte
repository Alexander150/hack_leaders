<script>
	import Logout from '../components/Logout.svelte';
	import Cookies from 'js-cookie';

	let logged = Cookies.get('token') ? true : false;

	function onLogout(event) {
		logged = false;
	}
</script>

<div class="home">
	{#if logged}
		<Logout on:logout={onLogout}/>
	{/if}
	<div class="ts-container">
		<a href="/login/teacher">
			<div class="teacher">
				<img src="./images/teacher.svg" >
				<h1> Я учитель</h1>
				<h2> Создать тест, посмотреть результаты, изменить тест</h2>
			</div>
		</a>
		<a href="/login/student">
			<div class="student">
				<img src="./images/student.svg">
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
 		background-image: url(../images/background.png);
 		background-size: cover;
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
 		border-radius: 20px;
 		background-color: rgba(61, 31, 84, 0.67) ;
 		text-align: center;
 		color: white;
 		border: 3px solid white;
 		opacity: 50%;
 	}
 	.ts-container .teacher img {
 		margin: 100px auto 20px;
 	}
 	.ts-container .teacher h1 {
 		margin: 0;
 		font-size: 30px;
 		padding: 25px 0;
 	}
 	.ts-container .teacher h2 {
 		max-width: 250px;
 		margin: 0 auto;
 		font-size: 20px;
 	}
 	.ts-container .student img {
 		margin: 100px auto 20px;
 	}
 	.ts-container .student{
 	 	margin:10px;
 		width: 450px;
 		height:450px;
 		border-radius: 20px;
 		text-align: center;
 		color: white;
 		border: 3px solid white; 		
 		background-color: rgba(61, 31, 84, 0.67);
 		opacity: 50%;
 	}
 	.ts-container .student h1 {
 		margin: 0;
 		font-size: 30px;
 		padding-bottom: 25px;
 	}
 	.ts-container .student h2 {
 		max-width: 250px;
 		margin: 0 auto;
 		font-size: 20px;
 	}
</style>