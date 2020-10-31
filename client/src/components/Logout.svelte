<script>
	import Cookies from 'js-cookie';
	import { createEventDispatcher } from 'svelte';
	import { user_store } from '../stores/user.store.js';

	const dispatch = createEventDispatcher();

	function logout() {
		Cookies.remove('token');
		user_store.set({});
		dispatch('logout');
	}

</script>

<button on:click={logout}>Выйти</button>