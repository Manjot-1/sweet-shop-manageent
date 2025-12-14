<script lang="ts">
  import { authStore } from '$lib/stores/auth';
  import { Button } from '$lib/components/ui/button';
  import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '$lib/components/ui/card';
  import { Input } from '$lib/components/ui/input';
  import { Label } from '$lib/components/ui/label';

  let email = '';
  let password = '';
  let isSignUp = false;
  let error = '';
  let loading = false;

  async function handleSubmit() {
    error = '';
    loading = true;

    try {
      const result = isSignUp 
        ? await authStore.signUp(email, password)
        : await authStore.signIn(email, password);

      if (result.error) {
        error = result.error.message;
      } else if (isSignUp) {
        error = 'Check your email to confirm your account';
      }
    } catch (e) {
      error = 'An unexpected error occurred';
    } finally {
      loading = false;
    }
  }

  function toggleMode() {
    isSignUp = !isSignUp;
    error = '';
  }
</script>

<div class="flex min-h-screen items-center justify-center p-4">
  <Card class="w-full max-w-md">
    <CardHeader>
      <CardTitle>{isSignUp ? 'Create Account' : 'Sign In'}</CardTitle>
      <CardDescription>
        {isSignUp 
          ? 'Create your account to manage the sweet shop' 
          : 'Sign in to your account to continue'}
      </CardDescription>
    </CardHeader>
    <CardContent>
      <form on:submit|preventDefault={handleSubmit} class="space-y-4">
        <div class="space-y-2">
          <Label for="email">Email</Label>
          <Input
            id="email"
            type="email"
            bind:value={email}
            placeholder="email@example.com"
            required
            disabled={loading}
          />
        </div>
        <div class="space-y-2">
          <Label for="password">Password</Label>
          <Input
            id="password"
            type="password"
            bind:value={password}
            placeholder="••••••••"
            required
            disabled={loading}
            minlength={6}
          />
        </div>
        {#if error}
          <p class="text-sm text-destructive">{error}</p>
        {/if}
        <Button type="submit" class="w-full" disabled={loading}>
          {loading ? 'Loading...' : isSignUp ? 'Sign Up' : 'Sign In'}
        </Button>
      </form>
      <div class="mt-4 text-center text-sm">
        <button
          type="button"
          on:click={toggleMode}
          class="text-primary hover:underline"
          disabled={loading}
        >
          {isSignUp 
            ? 'Already have an account? Sign in' 
            : "Don't have an account? Sign up"}
        </button>
      </div>
    </CardContent>
  </Card>
</div>
