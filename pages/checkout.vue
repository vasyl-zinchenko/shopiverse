<template>
  <div class=" grid h-16 place-items-center">
    <div class="max-w-[1200px] p-4 border" id="checkout-page">
      <!-- Display a payment form -->
      <form @submit.prevent="handleSubmit" id="payment-form">
        <div id="payment-element">
          <!--Stripe.js injects the Payment Element-->
        </div>
        <button id="submit">
          <div class="spinner hidden" id="spinner"></div>
          <span id="button-text">Pay now</span>
        </button>
        <div id="payment-message" class="hidden"></div>
      </form>
    </div>
  </div>
</template>

<script setup>
const config = useRuntimeConfig();
const { stripePK } = config.public;
let stripe;
let elements;
let clientSecret;
const cart = useCart();

const calcTotalCart = computed(
  () => cart.value.reduce((a, b) => a + b.price, 0) * 100
);

onMounted(async () => {
  stripe = await Stripe(stripePK);
  const initialize = async () => {
    const { data } = await useFetch('/api/stripe/paymentintent', {
      method: 'post',
      body: {
        amount: calcTotalCart.value,
      },
    });

    clientSecret = data.value;
    const appearance = {
      theme: 'stripe',
    };

    const paymentElementOptions = {
      layouts: 'tabs',
    };

    elements = stripe.elements({
      appearance,
      clientSecret,
    });

    const paymentElement = elements.create('payment', paymentElementOptions);

    paymentElement.mount('#payment-element');
  };

  initialize();
  checkStatus();
});

async function handleSubmit() {
  setLoading(true);

  const { error } = await stripe.confirmPayment({
    elements,
    confirmParams: {
      // Make sure to change this to your payment completion page
      return_url: '/payment-success',
    },
  });

  // This point will only be reached if there is an immediate error when
  // confirming the payment. Otherwise, your customer will be redirected to
  // your `return_url`. For some payment methods like iDEAL, your customer will
  // be redirected to an intermediate site first to authorize the payment, then
  // redirected to the `return_url`.
  if (error.type === 'card_error' || error.type === 'validation_error') {
    showMessage(error.message);
  } else {
    showMessage('An unexpected error occurred.');
  }

  setLoading(false);
}

function showMessage(messageText) {
  const messageContainer = document.querySelector('#payment-message');

  messageContainer.classList.remove('hidden');
  messageContainer.textContent = messageText;

  setTimeout(function () {
    messageContainer.classList.add('hidden');
    messageContainer.textContent = '';
  }, 4000);
}

function setLoading(isLoading) {
  if (isLoading) {
    // Disable the button and show a spinner
    document.querySelector('#submit').disabled = true;
    document.querySelector('#spinner').classList.remove('hidden');
    document.querySelector('#button-text').classList.add('hidden');
  } else {
    document.querySelector('#submit').disabled = false;
    document.querySelector('#spinner').classList.add('hidden');
    document.querySelector('#button-text').classList.remove('hidden');
  }
}
</script>

<style scoped>
/* Variables */
* {
  box-sizing: border-box;
}

#checkout-page {
  font-family: -apple-system, BlinkMacSystemFont, sans-serif;
  font-size: 16px;
  -webkit-font-smoothing: antialiased;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-content: center;
  height: 100vh;
  width: 100vw;
}

form {
  width: 30vw;
  min-width: 500px;
  align-self: center;
  box-shadow: 0px 0px 0px 0.5px rgba(50, 50, 93, 0.1),
    0px 2px 5px 0px rgba(50, 50, 93, 0.1), 0px 1px 1.5px 0px rgba(0, 0, 0, 0.07);
  border-radius: 7px;
  padding: 40px;
  margin-top: auto;
  margin-bottom: auto;
}

.hidden {
  display: none;
}

#payment-message {
  color: rgb(105, 115, 134);
  font-size: 16px;
  line-height: 20px;
  padding-top: 12px;
  text-align: center;
}

#payment-element {
  margin-bottom: 24px;
}

/* Buttons and links */
button {
  background: #0055de;
  font-family: Arial, sans-serif;
  color: #ffffff;
  border-radius: 4px;
  border: 0;
  padding: 12px 16px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  display: block;
  transition: all 0.2s ease;
  box-shadow: 0px 4px 5.5px 0px rgba(0, 0, 0, 0.07);
  width: 100%;
}
button:hover {
  filter: contrast(115%);
}
button:disabled {
  opacity: 0.5;
  cursor: default;
}

/* spinner/processing state, errors */
.spinner,
.spinner:before,
.spinner:after {
  border-radius: 50%;
}
.spinner {
  color: #ffffff;
  font-size: 22px;
  text-indent: -99999px;
  margin: 0px auto;
  position: relative;
  width: 20px;
  height: 20px;
  box-shadow: inset 0 0 0 2px;
  -webkit-transform: translateZ(0);
  -ms-transform: translateZ(0);
  transform: translateZ(0);
}
.spinner:before,
.spinner:after {
  position: absolute;
  content: '';
}
.spinner:before {
  width: 10.4px;
  height: 20.4px;
  background: #0055de;
  border-radius: 20.4px 0 0 20.4px;
  top: -0.2px;
  left: -0.2px;
  -webkit-transform-origin: 10.4px 10.2px;
  transform-origin: 10.4px 10.2px;
  -webkit-animation: loading 2s infinite ease 1.5s;
  animation: loading 2s infinite ease 1.5s;
}
.spinner:after {
  width: 10.4px;
  height: 10.2px;
  background: #0055de;
  border-radius: 0 10.2px 10.2px 0;
  top: -0.1px;
  left: 10.2px;
  -webkit-transform-origin: 0px 10.2px;
  transform-origin: 0px 10.2px;
  -webkit-animation: loading 2s infinite ease;
  animation: loading 2s infinite ease;
}

/* Payment status page */
#payment-status {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  row-gap: 30px;
  width: 30vw;
  min-width: 500px;
  min-height: 380px;
  align-self: center;
  box-shadow: 0px 0px 0px 0.5px rgba(50, 50, 93, 0.1),
    0px 2px 5px 0px rgba(50, 50, 93, 0.1), 0px 1px 1.5px 0px rgba(0, 0, 0, 0.07);
  border-radius: 7px;
  padding: 40px;
  opacity: 0;
  animation: fadeInAnimation 1s ease forwards;
}

#status-icon {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 40px;
  width: 40px;
  border-radius: 50%;
}

h2 {
  margin: 0;
  color: #30313d;
  text-align: center;
}

a {
  text-decoration: none;
  font-size: 16px;
  font-weight: 600;
  font-family: Arial, sans-serif;
  display: block;
}
a:hover {
  filter: contrast(120%);
}

#details-table {
  overflow-x: auto;
  width: 100%;
}

table {
  width: 100%;
  font-size: 14px;
  border-collapse: collapse;
}
table tbody tr:first-child td {
  border-top: 1px solid #e6e6e6; /* Top border */
  padding-top: 10px;
}
table tbody tr:last-child td {
  border-bottom: 1px solid #e6e6e6; /* Bottom border */
}
td {
  padding-bottom: 10px;
}

.TableContent {
  text-align: right;
  color: #6d6e78;
}

.TableLabel {
  font-weight: 600;
  color: #30313d;
}

#view-details {
  color: #0055de;
}

#retry-button {
  text-align: center;
  background: #0055de;
  color: #ffffff;
  border-radius: 4px;
  border: 0;
  padding: 12px 16px;
  transition: all 0.2s ease;
  box-shadow: 0px 4px 5.5px 0px rgba(0, 0, 0, 0.07);
  width: 100%;
}

@-webkit-keyframes loading {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes loading {
  0% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes fadeInAnimation {
  to {
    opacity: 1;
  }
}

@media only screen and (max-width: 600px) {
  form,
  #payment-status {
    width: 80vw;
    min-width: initial;
  }
}
</style>
