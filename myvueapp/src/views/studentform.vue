<template>
    <div>
      <h2>Add Student</h2>
      <form @submit.prevent="handleSubmit">
        <div>
          <label for="name">Name:</label>
          <input id="name" v-model="newStudent.name" required />
        </div>
        <!-- Add more input fields for other student properties as needed -->
  
        <button type="submit">Add Student</button>
      </form>
    </div>
  </template>
  
  <script>
  import { ref } from 'vue'
  import useCrud from '../services/crud'
  
  export default {
    setup() {
      const newStudent = ref({ name: '' })
      const { createData } = useCrud()
  
      const handleSubmit = async () => {
        try {
          await createData(newStudent.value)
          newStudent.value = { name: '' }
        } catch (error) {
          console.error('Error adding student:', error)
        }
      }
  
      return {
        newStudent,
        handleSubmit
      }
    }
  }
  </script>
  