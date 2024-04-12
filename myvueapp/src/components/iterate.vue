<template>
    <h1>for loop in vue js</h1>
    <ul>
        <li v-for="item in technology":key="item">
            {{ item }}


        </li>
    </ul>
    <br/><br/>
    <ul>
        <li v-for="item in user":key="item">
            Name : {{ item.name }} and Email : {{ item.email }} 
        </li>                                                                                       
    </ul>
</template>

<script>
export default {
    name:"iterate",
    data(){
        return{
            technology:['java','php','python'],
            user:[
                {
                name:"yashpal",
                email:"yashpal@gmail.com"
            },
            {
                name:"vishal",
                email:"vishal@gmail.com"

            }
        ]

        }
    }

}
</script>