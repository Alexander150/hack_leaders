<script>
	fetch("http://localhost:3000/tasks/check")
	.then(r => r.json())
	.then(r => console.log("true"))
</script>