<template>
  <div class="header">
    <h1>Welcome to Shopiverse</h1>
  </div>

  <div class="container">
    <div class="section">
      <h2>Who We Are</h2>
      <p>
        Shopiverse is your go-to online shopping destination, offering a vast
        selection of products across categories like electronics, fashion, home
        goods, and more. Founded with a mission to connect shoppers to quality
        products, we make online shopping simple, reliable, and enjoyable.
      </p>
    </div>

    <div class="section">
      <h2>Our Mission</h2>
      <p>
        We aim to empower customers worldwide by providing access to the best
        products at competitive prices, with exceptional customer service. At
        Shopiverse, we believe in creating a seamless shopping experience that
        fits into your lifestyle.
      </p>
    </div>

    <div class="section">
      <h2>Why Choose Shopiverse?</h2>
      <div class="features">
        <div class="feature-card">
          <h3>Vast Product Range</h3>
          <p>
            Discover thousands of products across multiple categories tailored
            to meet your needs.
          </p>
        </div>
        <div class="feature-card">
          <h3>Secure Shopping</h3>
          <p>
            Your data and transactions are protected with industry-standard
            encryption.
          </p>
        </div>
        <div class="feature-card">
          <h3>Fast Delivery</h3>
          <p>
            Enjoy reliable and quick delivery options, no matter where you are.
          </p>
        </div>
        <div class="feature-card">
          <h3>24/7 Customer Support</h3>
          <p>
            Our dedicated team is here to assist you around the clock with any
            inquiries.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup></script>

<style scoped>
.header {
  background-color: #4caf50;
  color: white;
  text-align: center;
  padding: 20px 0;
}

.header h1 {
  margin: 0;
  font-size: 2.5rem;
}

.container {
  max-width: 1200px;
  margin: 20px auto;
  padding: 20px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.section {
  margin-bottom: 40px;
}

.section h2 {
  font-size: 2rem;
  color: #4caf50;
  margin-bottom: 10px;
}

.section p {
  font-size: 1rem;
  line-height: 1.6;
}

.features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
}

.feature-card {
  background-color: #f1f1f1;
  padding: 20px;
  border-radius: 8px;
  text-align: center;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feature-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
}

.feature-card h3 {
  margin: 0;
  font-size: 1.5rem;
  color: #4caf50;
  margin-bottom: 10px;
}

.feature-card p {
  font-size: 1rem;
  color: #555;
}

.footer {
  text-align: center;
  padding: 20px 0;
  background-color: #4caf50;
  color: white;
  margin-top: 40px;
}

.footer p {
  margin: 0;
  font-size: 1rem;
}
</style>
