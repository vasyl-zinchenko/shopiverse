<template>
  <div class="min-h-screen bg-gray-100 py-8">
    <div class="max-w-4xl mx-auto bg-white shadow-xl rounded-2xl p-6">
      <div class="flex flex-col sm:flex-row items-center gap-6">
        <img
          :src="
            user.user_metadata.avatar_url || 'https://via.placeholder.com/150'
          "
          alt="User Avatar"
          class="w-32 h-32 rounded-full shadow-lg object-cover border-2 border-blue-500"
        />
        <div class="text-center sm:text-left">
          <h1 class="text-2xl font-bold text-gray-800">
            {{ user.user_metadata.full_name }}
          </h1>
          <p class="text-gray-600">
            Email:
            <span class="font-medium">{{
              user.email || 'example@mail.com'
            }}</span>
          </p>
          <p v-if="user.address" class="text-gray-600">
            Address:
            <span class="font-medium">{{
              user.address || '123 Default St, Cityville'
            }}</span>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
const user = useSupabaseUser();
</script>

<style scoped>
body {
  font-family: 'Inter', sans-serif;
}
</style>
