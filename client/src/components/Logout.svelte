<script>
	import Cookies from 'js-cookie';
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	function logout() {
		Cookies.remove('token');
		dispatch('logout');
	}

</script>

<button on:click={logout}>Выйти</button>