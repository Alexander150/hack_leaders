<script>
	export let params;

</script>

<div>
	{#if params.user == "teacher"}
		<div>Учитель</div>
	{/if}
	{#if params.user == "student"}
		<div>Ученик</div>
	{/if}
</div>

<style type="text/css" media="screen">
	.rasim-huilan{

	}
	
</style>