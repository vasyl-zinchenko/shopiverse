<template>
  <section
    class="flex justify-center mt-4 bg-white md:py-16 dark:bg-gray-900 antialiased"
  >
    <Loading v-if="pending" />
    <ProductDetail v-else :product="product" />
  </section>
</template>

<script setup>
const route = useRoute();
const id = route.params.id;
const { data: product, pending } = await useFetch(
  () => {
    return `/api/products/find-product-by-id/${id}`;
  },
  {
    lazy: true,
  }
);
</script>

<style lang="scss" scoped></style>
