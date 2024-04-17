<template>
  <div>
    <h2 :style="styleObject">Shopping Cart</h2>
    <ul>
      <li v-for="product in products" :key="product.id">
        {{ product.name }} - ${{ product.price }} - Quantity: {{ product.quantity }}
        <button @click="incrementQuantity(product)">+</button>
        <button @click="decrementQuantity(product)">-</button>
        <span>Total Price: ${{ totalProductPrice(product) }}</span>
      </li>
    </ul>
    <p>Total Cart Price: ${{ totalCartPrice }}</p>
  </div>
</template>

<script>
import { ref, computed, reactive, watch } from 'vue';

export default {
  setup() {
    const products = ref([
      { id: 1, name: 'Product A', price: 10, quantity: 2 },
      { id: 2, name: 'Product B', price: 15, quantity: 1 },
      { id: 3, name: 'Product C', price: 20, quantity: 3 }
    ]);

    const totalProductPrice = (product) => {
      return product.price * product.quantity;
    };

    const totalCartPrice = computed(() => {
      return products.value.reduce((total, product) => {
        return total + totalProductPrice(product);
      }, 0);
    });

    const incrementQuantity = (product) => {
      console.log(`Incrementing quantity of ${product.name}`);
      product.quantity++;
    };

    const decrementQuantity = (product) => {
      console.log(`Decrementing quantity of ${product.name}`);
      if (product.quantity > 0) {
        product.quantity--;
      }
    };

 

    const styleObject = reactive({
      color: 'red',
      fontSize: '30px'
    });

    return {
      products,
      totalProductPrice,
      totalCartPrice,
      incrementQuantity,
      decrementQuantity,
      styleObject
    };
  }
}
</script>
