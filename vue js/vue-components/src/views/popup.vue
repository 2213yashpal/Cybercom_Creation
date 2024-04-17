<script >
export default{
    name:'popup',
    emits:{
        close:(name) =>{
            if(!name){
                return false
            }else{
                return true
            }

        }
    },
    data(){
        return{
            name:''
        }

    }
}

</script>

<template>
    <div>
        <h2>this is popup</h2>
        <input type="text" v-model="name"/>
        <button @click="$emit('close',name)">close popup</button>
    </div>
</template>

<style  scoped>

</style>