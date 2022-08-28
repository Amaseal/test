<script>
  let response;
  const fetch = async () => {
    const res = await fetch("https://cms.sghomedecor.com/api/products");
    const data = await res.json();
    response = data;
  };
</script>

<button on:click={fetch()}>fetch</button>
<h1>Welcome to SvelteKit</h1>
<p>
  Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation
</p>

{response}
