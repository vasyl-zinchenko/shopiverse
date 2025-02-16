<template>
  <div
    :id="`productcomp${product.id}`"
    class="rounded-lg border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-700 dark:bg-gray-700"
  >
    <div class="h-56 w-full dark:bg-white rounded-md">
      <NuxtLink :to="`product-${product.id}`">
        <img
          class="mx-auto h-full object-contain"
          :src="`${product.image}`"
          alt="product image"
        />
      </NuxtLink>
    </div>

    <div class="pt-6">
      <div class="mb-4 flex items-center justify-between gap-4">
        <span
          class="me-2 rounded bg-blue-100 px-2.5 py-0.5 text-xs font-medium text-primary-800 dark:bg-[#92e393] dark:text-primary-600"
        >
          Up to {{ randomDiscount }}% off
        </span>
      </div>

      <NuxtLink
        :to="`product-${product.id}`"
        class="line-clamp-2 h-[45px] text-lg font-semibold leading-tight text-gray-900 hover:underline dark:text-white"
        >{{ product.title }}</NuxtLink
      >

      <div class="mt-2 flex items-center gap-2">
        <div class="flex items-center">
          <template v-for="index in 5" :key="index">
            <svg
              v-if="index <= roundedRating"
              class="w-4 h-4 text-yellow-300"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                d="M13.849 4.22c-.684-1.626-3.014-1.626-3.698 0L8.397 8.387l-4.552.361c-1.775.14-2.495 2.331-1.142 3.477l3.468 2.937-1.06 4.392c-.413 1.713 1.472 3.067 2.992 2.149L12 19.35l3.897 2.354c1.52.918 3.405-.436 2.992-2.15l-1.06-4.39 3.468-2.938c1.353-1.146.633-3.336-1.142-3.477l-4.552-.36-1.754-4.17Z"
              />
            </svg>
            <svg
              v-else
              class="w-4 h-4 text-gray-300 dark:text-gray-600"
              xmlns="http://www.w3.org/2000/svg"
              fill="currentColor"
              viewBox="0 0 24 24"
            >
              <path
                d="M13.849 4.22c-.684-1.626-3.014-1.626-3.698 0L8.397 8.387l-4.552.361c-1.775.14-2.495 2.331-1.142 3.477l3.468 2.937-1.06 4.392c-.413 1.713 1.472 3.067 2.992 2.149L12 19.35l3.897 2.354c1.52.918 3.405-.436 2.992-2.15l-1.06-4.39 3.468-2.938c1.353-1.146.633-3.336-1.142-3.477l-4.552-.36-1.754-4.17Z"
              />
            </svg>
          </template>
        </div>

        <p class="text-sm font-medium text-gray-900 dark:text-white">
          {{ product.rating_rate }}
        </p>
        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
          ({{ product.rating_count }})
        </p>
      </div>

      <ul class="mt-2 flex items-center gap-4">
        <li class="flex items-center gap-2">
          <svg
            class="h-4 w-4 text-gray-500 dark:text-gray-400"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            fill="none"
            viewBox="0 0 24 24"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="m7.171 12.906-2.153 6.411 2.672-.89 1.568 2.34 1.825-5.183m5.73-2.678 2.154 6.411-2.673-.89-1.568 2.34-1.825-5.183M9.165 4.3c.58.068 1.153-.17 1.515-.628a1.681 1.681 0 0 1 2.64 0 1.68 1.68 0 0 0 1.515.628 1.681 1.681 0 0 1 1.866 1.866c-.068.58.17 1.154.628 1.516a1.681 1.681 0 0 1 0 2.639 1.682 1.682 0 0 0-.628 1.515 1.681 1.681 0 0 1-1.866 1.866 1.681 1.681 0 0 0-1.516.628 1.681 1.681 0 0 1-2.639 0 1.681 1.681 0 0 0-1.515-.628 1.681 1.681 0 0 1-1.867-1.866 1.681 1.681 0 0 0-.627-1.515 1.681 1.681 0 0 1 0-2.64c.458-.361.696-.935.627-1.515A1.681 1.681 0 0 1 9.165 4.3ZM14 9a2 2 0 1 1-4 0 2 2 0 0 1 4 0Z"
            />
          </svg>
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
            Best Seller
          </p>
        </li>

        <li class="flex items-center gap-2">
          <svg
            class="h-4 w-4 text-gray-500 dark:text-gray-400"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-width="2"
              d="M8 7V6c0-.6.4-1 1-1h11c.6 0 1 .4 1 1v7c0 .6-.4 1-1 1h-1M3 18v-7c0-.6.4-1 1-1h11c.6 0 1 .4 1 1v7c0 .6-.4 1-1 1H4a1 1 0 0 1-1-1Zm8-3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"
            />
          </svg>
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">
            Best Price
          </p>
        </li>
      </ul>

      <div class="mt-4 flex items-center justify-between gap-4">
        <p
          class="text-2xl font-extrabold leading-tight text-gray-900 dark:text-white"
        >
          ${{ product.price }}
        </p>

        <button
          @click="addToCart(product)"
          :disabled="alreadyInCart(cart, product) && user"
          type="button"
          class="flex items-center rounded-lg bg-blue-500 p-1 text-sm font-medium text-white hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-primary-300 dark:bg-blue-400 dark:hover:bg-blue-700 dark:focus:ring-primary-800"
        >
          <svg
            v-if="alreadyInCart(cart, product) && user"
            class="w-5 h-5 text-white"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            fill="currentColor"
            viewBox="0 0 24 24"
          >
            <path
              fill-rule="evenodd"
              d="M4 4a1 1 0 0 1 1-1h1.5a1 1 0 0 1 .979.796L7.939 6H19a1 1 0 0 1 .979 1.204l-1.25 6a1 1 0 0 1-.979.796H9.605l.208 1H17a3 3 0 1 1-2.83 2h-2.34a3 3 0 1 1-4.009-1.76L5.686 5H5a1 1 0 0 1-1-1Z"
              clip-rule="evenodd"
            />
          </svg>

          <svg
            v-else
            class="h-5 w-5 text-white"
            aria-hidden="true"
            xmlns="http://www.w3.org/2000/svg"
            width="24"
            height="24"
            fill="none"
            viewBox="0 0 24 24"
          >
            <path
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 4h1.5L8 16m0 0h8m-8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm8 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4Zm.75-3H7.5M11 7H6.312M17 4v6m-3-3h6"
            />
          </svg>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
const props = defineProps(['product']);

const user = useSupabaseUser();
const cart = useCart();
const roundedRating = Math.round(props.product.rating_rate);

const alreadyInCart = (cartState, productToCheck) => {
  return cartState.some((productInCart) => {
    return productInCart.id === productToCheck.id;
  });
};

const randomDiscount = computed(
  () => Math.floor(Math.random() * (30 - 5 + 1)) + 5
);

const addToCart = (product) => {
  if (user.value) {
    cart.value.push(product);
  } else {
    alert('Log in to start adding products to cart');
  }
};
</script>

<style lang="scss" scoped></style>
