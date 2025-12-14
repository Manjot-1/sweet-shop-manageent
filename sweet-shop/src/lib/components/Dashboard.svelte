<script lang="ts">
  import { authStore } from '$lib/stores/auth';
  import { Button } from '$lib/components/ui/button';
  import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '$lib/components/ui/card';

  async function handleSignOut() {
    await authStore.signOut();
  }
</script>

<div class="min-h-screen p-8">
  <div class="mx-auto max-w-7xl">
    <div class="mb-8 flex items-center justify-between">
      <h1 class="text-4xl font-bold">Sweet Shop Dashboard</h1>
      <Button on:click={handleSignOut} variant="outline">
        Sign Out
      </Button>
    </div>

    <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
      <Card>
        <CardHeader>
          <CardTitle>Sweets</CardTitle>
          <CardDescription>Manage your sweet inventory</CardDescription>
        </CardHeader>
        <CardContent>
          <p class="text-sm text-muted-foreground">
            Coming soon: Sweet management features
          </p>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Orders</CardTitle>
          <CardDescription>Track customer purchases</CardDescription>
        </CardHeader>
        <CardContent>
          <p class="text-sm text-muted-foreground">
            Coming soon: Order tracking
          </p>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Inventory</CardTitle>
          <CardDescription>Monitor stock levels</CardDescription>
        </CardHeader>
        <CardContent>
          <p class="text-sm text-muted-foreground">
            Coming soon: Inventory management
          </p>
        </CardContent>
      </Card>
    </div>
  </div>
</div>
