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

<div>
	<input type="text" name="login" bind:value={user.username} placeholder="Логин" on:blur={checkUser}>
	<input type="password" name="password" bind:value={user.password} placeholder="Пароль">
	{#if check.status}
		<button on:click={signIn}>Войти</button>
	{:else}
		<button on:click={signUp}>Зарегистироваться</button>
	{/if}
	{#if !check.type}
		<a href="/login/student">Войти как ученик</a>
	{/if}
</div>

<style type="text/css" media="screen">
	.rasim-huilan{

	}
	
</style>