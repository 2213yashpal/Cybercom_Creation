<template>
        <createpost/>

    <div class="container">
        <button @click="getPosts">Load Posts</button>
        <h3 v-if="errorMessages">{{ errorMessages }}</h3>
        <div v-for="post in posts" :key="post.id">
            <h3>{{ post.id }}. {{ post.title }}</h3>
            <p>{{ post.body }}</p>
            <hr>

        </div>        

    </div>
</template>



<script>
import axios from 'axios';
import { errorMessages } from 'vue/compiler-sfc';
import createpost from './createpost.vue';
export default{
    name:'postlist',
    components:{
        createpost
    },
    data(){
        return{
            posts:[''],
            errorMessages:''
        }
    },
    methods:{
        getPosts(){
            axios.get('https://jsonplaceholder.typicode.com/posts')
            .then((response)=> {
                console.log(response.data)
                this.posts=response.data


            })
            .catch(error=> {
                console.log(error.message);
                this.errorMessages=error.message
            })
        }
    }
}
</script>

<style scoped>
.container{
  margin-top: 90px;
}
</style>
