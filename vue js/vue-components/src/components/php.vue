

<template>
    <div>
        <p>PHP is a server-side scripting language widely used for web development. </p>
        <p>It is especially suited for creating dynamic web pages and building web applications.</p>
        <p> PHP powers popular content management systems like WordPress, Joomla, and Drupal.  </p>
            <p>Learning PHP enables developers to create dynamic and interactive web experiences.</p>
    </div>
    <input type="text" v-model="name"/>
</template>

<script >
export default{
    name:'Php',
    data(){
        return{
            name:''

        }
    },

    methods:{

    },
    
}

</script>

<style lang="css" scoped>
p{    
    font-size: 20px;
}

</style>