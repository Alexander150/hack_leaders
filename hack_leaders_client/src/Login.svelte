<script>
	export let params;

	let user = {
		user_type: params.user_type,
	}

</script>

<div>
	{#if params.user_type == "teacher"}
		<div>Учитель</div>
	{/if}
	{#if params.user_type == "student"}
		<div>Ученик</div>
	{/if}
</div>

<style type="text/css" media="screen">
	.rasim-huilan{

	}
	
</style>