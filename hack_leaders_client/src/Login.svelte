<script>
	export let params;

	let user = {
		user_type: params.user_type,
		username: "",
		password: "",
	}

	let check = false;

	async function checkUser(){
		// проверка на существование
		const url = "http://localhost:3000/check";
		console.log(user);
		const response = await fetch(url, {
			method: "POST",
			headers: {
				'Accept': 'application/json',
			    'Content-Type': 'application/json'
			},
			body: JSON.stringify(user)
		});
		const answer = await response.json();
		check = answer.status;
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
	{#if check}
		<button on:click={signIn}>Войти</button>
	{:else}
		<button on:click={signUp}>Зарегистироваться</button>
	{/if}
</div>

<style type="text/css" media="screen">
	.rasim-huilan{

	}
	
</style>