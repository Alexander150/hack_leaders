<script>
	import router from 'page';
	import Home from './routing/Home.svelte'
	import ErrorPage from './routing/ErrorPage.svelte'
	import StudentHome from './routing/student/StudentHome.svelte'
	import TeacherHome from './routing/teacher/TeacherHome.svelte'
	import Login from './Login.svelte'

	// export let params; если надо в компоненте получить параметры со ссылки (:id / :user / :params)

	let page;
	let params;
	router('/', () => (page = Home));
	router('/student/home', () => (page = StudentHome));
	router('/teacher/home', () => (page = TeacherHome));
	router('/login/:user', (ctx, next) => {params = ctx.params; next();} () => (page = Login));
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