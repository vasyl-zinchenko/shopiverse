<template>
  <div>
    <form class="flex items-center max-w-sm mx-auto">
      <label for="simple-search" class="sr-only">Search</label>
      <div class="relative w-full">
        <input
          v-model="searchInput"
          type="text"
          id="simple-search"
          class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Search for any product..."
          required
        />
      </div>
    </form>

		<br>

    <div v-if="searchResults && searchInput" class="grid grid-cols-4 gap-4">
      <div v-for="product in searchResults">
        <ProductComp :product="product" />
      </div>
    </div>
  </div>
</template>

<script setup>
const searchInput = useState(() => null);
const searchResults = useState(() => null);
const { data } = await useFetch('/api/products/search/query', {
  immediate: false,
  query: {
    input: searchInput,
  },
  transform: (data) => {
    searchResults.value = data;
  },
});
</script>

<style lang="scss" scoped></style>
