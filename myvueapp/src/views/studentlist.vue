<template>
    <div>
      <h2>Student List</h2>
      <ul>
        <li v-for="student in students" :key="student.id">{{ student.name }}</li>
      </ul>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue'
  import useCrud from '../services/crud'
  
  export default {
    setup() {
      const students = ref([])
      const { fetchData } = useCrud()
  
      onMounted(async () => {
        students.value = await fetchData()
      })
  
      return {
        students
      }
    }
  }
  </script>
  