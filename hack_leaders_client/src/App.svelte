<script>
	import router from 'page';
	import Home from './routing/Home.svelte'
	import ErrorPage from './routing/ErrorPage.svelte'
	import StudentHome from './routing/student/StudentHome.svelte'
	import TeacherHome from './routing/teacher/TeacherHome.svelte'
	import Registration from './Registration.svelte'
	import Login from './Login.svelte'

	// export let params; если надо в компоненте получить параметры со ссылки (:id / :user / :params)

	let page;
	let params;
	router('/', () => (page = Home));
	router('/student/home', () => (page = StudentHome));
	router('/teacher/home', () => (page = TeacherHome));
	router('/reg', () => (page = Registration));
	router('/log', () => (page = Login));
	// router('/users/:id', (ctx, next) => {params = ctx.params; next();},() => (page = User));
	router("*", () => (page = ErrorPage));

	router.start();
</script>

<ul>
	<li><a href="/">Home</a></li>
	<li><a href="/reg">Регистрация</a></li>
	<li><a href="/log">Вход</a></li>
	<li><a href="/student/home">Учитель</a></li>
	<li><a href="/teacher/home">Ученик</a></li>
	<!-- <li><a href="/users/:id">Пользователь с id id</a></li> -->
</ul>

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