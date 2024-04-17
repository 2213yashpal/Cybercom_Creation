<template>
  <div>
    <button @click="toggleDetails">{{ show ? 'Hide' : 'Show' }} details</button>
    <h2 v-if="show">Two-Way Binding Example</h2>
    <div v-if="show">
      <label>Name : </label>
      <input type="text" v-model="name" placeholder="Enter name" />
      <br /><br />
      <label>Email : </label>
      <input type="text" v-model="email" placeholder="Enter email" />
      <br /><br />
      <span>gender : </span>
      <input type="radio" id="male" value="male" v-model="gender">
      <label for="male">Male</label>
      <input type="radio" id="female" value="female" v-model="gender">
      <label for="female">Female</label>
      <br /><br />

      <span>Technology : </span>

      <label for="java">
        <input type="checkbox" id="java" value="java" v-model="technology">
        java
      </label>
      <label for="python">
        <input type="checkbox" id="python" value="python" v-model="technology">
        python
      </label>
      <label for="c#">
        <input type="checkbox" id="c#" value="c#" v-model="technology">
        c#
      </label>
      <br /><br />
      <button @click="getData" type="button">Get values</button>
    </div>
    <h4 v-if="dataRetrieved">name : {{name}}</h4>
    <h4 v-if="dataRetrieved">Email : {{email}}</h4>
    <h4 v-if="dataRetrieved">Gender : {{gender}}</h4>
    <h4 v-if="dataRetrieved">Technology : {{technology}}</h4>
  </div>
</template>

<script>
export default {
  data() {
    return {
      show: false,
      name: '',
      email: '',
      gender: '',
      technology: [],
      dataRetrieved: false
    };
  },
  methods: {
    getData() {
      console.log('Name:', this.name);
      console.log('Email:', this.email);
      console.log('Gender:', this.gender);
      console.log('Technology:', this.technology);
      
      this.dataRetrieved = true;
    },
    toggleDetails() {
      this.show = !this.show;
    }
  }
};
</script>

<style>
/* Your CSS styles */
</style>
