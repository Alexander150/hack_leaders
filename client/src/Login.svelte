<script>
	import { getContext } from 'svelte';

	export let params;

	const server_url = getContext('server_url')

	let user = {
		user_type: params.user_type,
		username: "",
		password: "",
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
			headers: {
				'Accept': 'application/json',
			    'Content-Type': 'application/json'
			},
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
	function signIn(){
		// send user to server to sign in him
		console.log(user);
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