<section class="student-tasks">
	<div class="my-tasks">
		<h1>Мои задачи:</h1>
		<div class="my-tasks__list">
			<div class="list__task">
				<div class="task__about">
					<h2>Задача 1</h2>
					<h3> Название задачи</h3>
				</div>
				<a href="/student/tasks/1" class="task__button">Начать решение </a>
			</div>
			<div class="list__task">
				<div class="task__about">
					<h2>Задача 2</h2>
					<h3> Название задачи</h3>
				</div>
				<a href="/student/tasks/2" class="task__button">Начать решение </a>
			</div>
		</div>
	</div>
</section>
<style>
	.student-tasks{
		padding: 100px 0;
 		width: 100vw;
 		height: 100vh;
 		background-image: url(../images/studenttasks.png);
 		background-size: cover;
 		background-position: center;
 		background-repeat: no-repeat;
	}
	.my-tasks{
		max-width: 750px;
		margin: 0 auto;
		padding: 40px;
		background: linear-gradient(120.52deg, rgba(48, 22, 68, 0.41) 0.64%, rgba(0, 0, 0, 0.62) 100%);
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
		border-radius: 3px;
	}
	.my-tasks h1{
		margin: 0 0 25px;
		font-size: 20px;
		color: white;
	}
	.my-tasks h1::after{
	  content: '';
	  margin-top: 10px;
      display: block;
      height: 1px;
      background: #3D1168;
	}
	.list__task{
		display: flex;
		justify-content: space-between;
		background: #F1F4F7;
		border: 0.1px solid #3D1168;
		box-sizing: border-box;
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.02);
		max-width: 750px;
		height: 65px;
		margin:   5px 0;
	}
	.task__about h2{
		margin: 0;
		padding: 9px 12px 1px;
		font-size: 16px;
	}
	.task__about h3{
		margin: 0;
		font-size: 18px;
		padding-left: 12px;
	}
	.task__button {
		font-size: 14px;
		text-decoration: none;
		text-align: center;
		margin: auto 40px;
		padding-top: 2px ;
		color: black;
		background: #FFFFFF;
		border: 0.4px solid #3D1168;
		box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.2);
		border-radius: 6px;
		width: 100%;
		max-width: 180px;
		height: 25px;
	}
</style>