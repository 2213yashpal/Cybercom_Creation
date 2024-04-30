<script setup lang="ts">
import axios from 'axios';


const formdata={
    userId:'',
    title:'',
    body:''
}
const createpost=()=>{
    axios.post('https://jsonplaceholder.typicode.com/posts',formdata)
    .then(res=>{
        console.log(res.data)
    })
    .catch(err=>{
        console.log(err)
    })
}

</script>

<template>
    <div class="container">
       <form @submit.prevent="createpost">
        <div>
            <label for="userId">postuserid</label>
        <input type="text" id="userId" v-model="formdata.userId">
        </div>
        <div>
            <label for="userTitle">post title</label>
        <input type="text" id="userTitle" v-model="formdata.userTitle">
        </div>
        <div>
            <label for="userBody">post body</label>
        <input type="text" id="userBody" v-model="formdata.userBody">
        </div>
        <div>
            <button>create post</button>
        </div>
       
       </form> 
    </div>
</template>

<style lang="css" scoped>
.container{
    position: relative;
    top : 10px
}

</style>