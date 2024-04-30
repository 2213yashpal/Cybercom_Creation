<!-- <template>
    <div>
      <input type="text" ref="myInput" placeholder="Type something..." />
    </div>
  </template>
  
  <script>
  export default {
    name:'templateref',
    mounted() {
      this.$refs.myInput.focus();
    }
  }
  </script>
   -->


   <template>
    <div>
      <input type="text" ref="myInput" placeholder="Type something..." />
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  
  const myInput = ref(null);
  
  onMounted(() => {
    myInput.value.focus();
  });
  </script>
  
  