<script>
	import router from 'page';
	import { setContext } from 'svelte';
	import Cookies from 'js-cookie';

	import Home from './routing/Home.svelte'
	import ErrorPage from './routing/ErrorPage.svelte'
	import StudentHome from './routing/student/StudentHome.svelte'
	import TeacherHome from './routing/teacher/TeacherHome.svelte'
	import Login from './Login.svelte'

	// export let params; если надо в компоненте получить параметры со ссылки (:id / :user / :params)

	setContext('server_url', "http://localhost:3000/");

	let page;
	let params;
	function isToken() {
		let token = Cookies.get('token');
		if (token) {
			return true;
		}
	}
	router('/', () => (page = Home));
	router('/student/home', () => (page = StudentHome));
	router('/teacher/home', () => (page = TeacherHome));
	router('/login/:user_type', (ctx, next) => {params = ctx.params; next();}, () => {
		if (isToken()) {
			router.redirect('/')
		}
		page = Login;});
	router("*", () => (page = ErrorPage));

	router.start();
</script>

<svelte:component this="{page}" params="{params}" />

<style>
	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>