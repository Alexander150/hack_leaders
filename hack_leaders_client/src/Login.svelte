<script>
	export let params;

	let user = {
		user_type: params.user_type,
		username: "",
		password: "",
	}

	let check = false;

	function checkUser(){
		// проверка на существование
		console.log("undef");
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
	<input type="text" name="login" bind:value={user.username} placeholder="Логин" on:change={checkUser}>
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