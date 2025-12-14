<script lang="ts">
  import { onMount } from 'svelte';
  import { authStore } from '$lib/stores/auth';
  import Login from '$lib/components/Login.svelte';
  import Dashboard from '$lib/components/Dashboard.svelte';

  onMount(() => {
    authStore.init();
  });
</script>

{#if $authStore.loading}
  <div class="flex min-h-screen items-center justify-center">
    <p class="text-lg text-muted-foreground">Loading...</p>
  </div>
{:else if $authStore.user}
  <Dashboard />
{:else}
  <Login />
{/if}
