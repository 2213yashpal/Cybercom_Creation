<template>
    <div>
      <p>Original price: {{ originalPrice }}</p>
      <p>Discounted price: {{ discountedPrice }}</p>
      <input type="number" v-model="discount" placeholder="Enter discount percentage">
    </div>
  </template>
  
  <script>
  import { ref, computed } from 'vue';
  
  export default {
    setup() {
      const originalPrice = ref(100);
      const discount = ref(10);
  
      const discountedPrice = computed({
        get() {
          return originalPrice.value - (originalPrice.value * discount.value / 100);
        },
        set(newValue) {
          const discountedValue = newValue || 0;
          originalPrice.value = discountedValue / (1 - discount.value / 100);
        }
      });
  
      return {
        originalPrice,
        discount,
        discountedPrice
      };
    }
  };
  </script>
  