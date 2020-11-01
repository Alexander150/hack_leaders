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

<div class="menu">
	<div class="mk">#МК</div>
	<div class="person"></div>
	<div class="curr_page_menu"></div>
	<div class="chart"></div>
	<div on:click={logout} class="logout"></div>
</div>

<style>
	.menu{
		background-image: url(../images/menu.png);
		background-size: 100%;
		background-repeat: no-repeat;
		width: 120px;
		height: 100%;
		position: fixed;
		left: 0;
		top: 0;
		/* padding: 38px 38px 41px; */
		color: white;
		font-size:  20px;
	}
	.menu .mk{
		margin-top: 39px;
		margin-left: 35px;
		margin-right: 43px;
	}
	.menu .person{
		margin-top: 130px;
		margin-left: 50px;
		margin-right: 46px;
		width: 24px;
		height: 24px;
		background-image: url(../images/person.svg);
		background-size: 100%;
	}
	.menu .curr_page_menu{
		margin-top: 74px;
		margin-left: 22px;
		margin-right: 22px;
		width: 76px;
		height: 76px;
		background-image: url(../images/curr_page_menu.svg);
		background-size: 100%;
	}
	.menu .chart{
		margin-top: 72px;
		margin-left: 50px;
		margin-right: 46px;
		width: 24px;
		height: 24px;
		background-image: url(../images/chart.svg);
		background-size: 100%;
	}
	.menu .logout{
		margin-bottom: 53px;
		margin-top: auto;
		margin-left: 48px;
		margin-right: 48px;
		width: 24px;
		height: 24px;
		background-image: url(../images/logout.svg);
		background-size: 100%;
	}	
</style>