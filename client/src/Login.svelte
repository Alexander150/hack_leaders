<script>
	import { getContext } from 'svelte';
	import Cookies from 'js-cookie';
	import { user_store } from './stores/user.store.js';
	import router from 'page';

	export let params;

	const server_url = getContext('server_url');
	let headers = getContext('std_headers');

	let user = {
		user_type: params.user_type,
		username: "student",
		password: "password",
	}

	let check = {
		status: true,
		type: true
	};

	async function checkUser(){
		// проверка на существование
		console.log(user);
		const response = await fetch(`${server_url}check/`, {
			method: "POST",
			headers: headers,
			body: JSON.stringify(user)
		});
		const answer = await response.json();
		check.status = answer.status;
		check.type = answer.type;
	}
	function signUp(){
		// send user to server to sign up him
		console.log(user);
	}
	async function signIn(){
		let response = await fetch(`${server_url}login/`, {
			method: "POST",
			headers: headers,
			body: JSON.stringify(user)
		});
		if (response.ok) {
			let result = await response.json();
			if ('token' in result) {
				Cookies.set('token', result.token);
				user_store.update(state => result.user);
				router.redirect(`/${result.user.user_type}/tasks/`)
				return;

			} else if ('error' in result) {
				Cookies.remove('token');
				alert(result.error);
				return;
			}
		}

		Cookies.remove('token');
		alert("Возникла ошибка");
	}
</script>
<div class="identify">
	<div class="login">
		<h1>Вход</h1>
		<div class="login__inputs">
			<input type="text" class="loginicon" name="login" bind:value={user.username} placeholder="Имя пользователя" on:blur={checkUser}>
			<input type="password" class="passwordicon" name="password" bind:value={user.password} placeholder="Пароль">
			<div class="login__button">
				{#if check.status}
					<button class="button-white" on:click={signIn}>Войти</button>
				{:else}
					<button class="button-white" on:click={signUp}>Зарегистироваться</button>
				{/if}
			</div>
		</div>
	</div>
	<div class="purple-block">
		<h1>Создайте аккаунт</h1>
		<h2>Зарегистрируйтесь и создайте свой тест!</h2>
		<button class="button-purple">Регистрация</button>
	</div>
</div>
<style>
	*{box-sizing: border-box;}
	.identify{
		display: grid;
		grid-template-columns: 1fr 0.8fr;
	}
	.login{
		padding-top: 250px;
		margin: 0 auto;
		
	}
	.login h1{
		margin: 0;
		text-align: center;
		color: #373B53;
		font-size: 45px;
	}
	.loginicon{
		background-image: url(../images/placeholderuser.svg);
 		background-position: 30px 50%;
 		background-repeat: no-repeat;

	}
	.passwordicon{
		background-image:  url(../images/placeholderlock.svg);
		background-repeat: no-repeat;
		background-position: 30px 50%;
	}
	.login__inputs{
		padding-top: 60px ;
	}
	.login__inputs input{
		padding-left: 76px;
		display: block;
		width: 546px;
		height: 76px;
		border: none;
		background-color: #F9F9F9;
	}
	.login__button{
		padding-top: 80px;
		display: flex;
		justify-content: center;
	}
	.button-white{
		align-self: center;
		text-align: center;
		background: white;
		margin: 0;
		padding: 20px 62px;
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
		margin: 0;
		padding: 20px 62px;
		color: white;
		font-size: 22px;
		line-height: 26px;
		text-align: center;
		border: 3px solid white;
		box-sizing: border-box;
		border-radius: 50px;
	}
	.purple-block{
		text-align: center;
 		height: 100vh;
		background-image: url(../images/purpleback.png);
 		background-size: cover;
 		background-position: center;
 		background-repeat: no-repeat;
	}
	.purple-block h1{
		font-size: 45px;
		padding-top: 350px;
		margin: 0;
		color: white;

	}
	.purple-block h2{
		font-size: 24px;
		max-width: 300px;
		padding: 30px 0 76px;
		font-weight: 100;
		margin: 0 auto;
		color: white;
	}	
</style> 