<template>
  <div class="flex flex-col min-h-screen bg-blue dark:bg-gray-800">
    <Header />
    <main class="max-w-[1200px] p-4 mx-auto">
      <slot />
    </main>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped></style>
