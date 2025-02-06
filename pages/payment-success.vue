<template>
  <div class="text-center">
    <h1
      class="mb-4 text-3xl font-extrabold text-gray-900 dark:text-white md:text-5xl lg:text-6xl"
    >
      <span
        class="text-transparent bg-clip-text bg-gradient-to-r to-emerald-600 from-sky-400"
        >Payment successful</span
      >
    </h1>
    <NuxtLink
      to="/"
      class="inline-flex items-center justify-center px-5 py-3 text-base font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 dark:focus:ring-blue-900"
    >
      Go Home
      <svg
        class="w-3.5 h-3.5 ms-2 rtl:rotate-180"
        aria-hidden="true"
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 14 10"
      >
        <path
          stroke="currentColor"
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M1 5h12m0 0L9 1m4 4L9 9"
        />
      </svg>
    </NuxtLink>
  </div>
</template>

<script setup></script>

<style lang="scss" scoped></style>
