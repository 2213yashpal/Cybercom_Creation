<template>
    <div>
      <p>Base price: ${{ basePrice }}</p>
      <p>Tax: ${{ tax }}</p>
      <p>Total price (including tax): ${{ totalPrice }}</p>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        price: 200,
        taxRate: 0.1 // 10%
      };
    },
    computed: {
      basePrice() {
        return this.price;
      },
      tax() {
        return this.price * this.taxRate;
      },
      totalPrice() {
        return this.price + this.tax;
      }
    }
  };
  </script>
  