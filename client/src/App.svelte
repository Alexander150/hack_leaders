<script>
	import router from 'page';
	import { setContext } from 'svelte';
	import Cookies from 'js-cookie';
	import { user_store } from './stores/user.store.js';
	import { getUser, tokenizeHeaders } from './helpers/user.helper.js';

	import Home from './routing/Home.svelte'
	import ErrorPage from './routing/ErrorPage.svelte'
	import StudentTasksId from './routing/student/StudentTasksId.svelte'
	import StudentTasks from './routing/student/StudentTasks.svelte'
	import TeacherHome from './routing/teacher/TeacherHome.svelte'
	import TeacherTasks from './routing/teacher/TeacherTasks.svelte'
	import Login from './Login.svelte'
	import Check from "./routing/student/Check.svelte"

	// export let params; если надо в компоненте получить параметры со ссылки (:id / :user / :params)

	let server_url = "http://localhost:3000/";
	const std_headers = {
		'Accept': 'application/json',
	    'Content-Type': 'application/json'
	};
	setContext('server_url', server_url);
	setContext('std_headers', std_headers);

	let page;
	let params;
	let token = Cookies.get('token');
	function isToken() {
		let token = Cookies.get('token');
		return token ? true : false;
	}
	if (token) {
		let headers = tokenizeHeaders(std_headers);
		getUser({token: token, headers: headers, server_url: server_url});
	}

	const logged_only = [
		'/student/home/',
		'/student/tasks/',
		'/teacher/tasks/',
		'/teacher/tasks/create/',
		'/student/check/'
	];
	const user_sub = user_store.subscribe(data => {
		console.log(router.current);
		if (!isToken() || !data) {
			if (logged_only.includes(router.current))
				router.redirect(`/`);
		}
	});

	router('/', () => (page = Home));
	router('/student/tasks/:id',
	(ctx, next) => {
		params = ctx.params;
		next();
	},
	() => {
		if (!isToken())
			router.redirect('/');
		else
			page = StudentTasksId});
	router('/student/tasks', () => {
		if (!isToken())
			router.redirect('/');
		else
			page = StudentTasks
	});
	router('/teacher/tasks', () => {
		if (!isToken())
			router.redirect('/');
		else
			page = TeacherTasks;
	});
	router('/teacher/tasks/create', () => {
		if (!isToken())
			router.redirect('/');
		else
			page = TeacherHome;
	});
	router('/student/check', () => {
		if (!isToken())
			router.redirect('/');
		else
			page = Check
	});
	router('/login', () => {
		router.redirect('/')
	});
	router('/login/:user_type', (ctx, next) => {params = ctx.params; next();}, () => {
		if (isToken()) {
			router.redirect('/');
		} else
			page = Login;
	});
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