<template>
  <div
    class="mb-4 grid gap-4 sm:grid-cols-2 md:mb-8 lg:grid-cols-3 xl:grid-cols-4"
    v-if="products"
  >
    <ProductItem v-for="product in products" :product="product" />
  </div>
</template>

<script setup>
const { data: products } = await useFetch('/api/products');
</script>

<style lang="scss" scoped></style>
