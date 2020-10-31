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

<div class="login">
	<h1>Вход</h1>
	<div class="login__inputs">
		<input type="text" name="login" bind:value={user.username} placeholder="Имя пользователя" on:blur={checkUser}>
		<input type="password" name="password" bind:value={user.password} placeholder="Пароль">
		{#if check.status}
			<button class="button-white" on:click={signIn}>Войти</button>
		{:else}
			<button class="button-white" on:click={signUp}>Зарегистироваться</button>
		{/if}
	</div>
</div>

<style>
	.login{
	}
	.login__inputs input{
		width: 546px;
		height: 76px;
		border: none;
		background: #F7F4F8;
	}
	.button-white{
		margin: 0;
		padding: 10px 62px;
		color: #3D1168;
		font-size: 22px;
		line-height: 26px;
		text-align: center;
		border: 3px solid #3D1168;
		box-sizing: border-box;
		border-radius: 50px;
	}
</style> 