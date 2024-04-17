import { ref } from 'vue'
import axios from 'axios'

const apiUrl = "http://localhost:5173/students"

export default function useCrud() {
  const data = ref([])
  const error = ref(null)
  const statusCode = ref(null)

  const fetchData = async () => {
    try {
      const response = await axios.get(apiUrl)
      data.value = response.data
      return response.data // Return data to use in components
    } catch (err) {
      error.value = err.message
      throw err // Rethrow error to handle in components
    }
  }

  const createData = async (newData) => {
    try {
      const response = await axios.post(apiUrl, newData)
      data.value.push(response.data)
      statusCode.value = response.status
    } catch (err) {
      error.value = err.message
      throw err
    }
  }

  const updateData = async (id, updatedData) => {
    try {
      const response = await axios.put(`${apiUrl}/${id}`, updatedData)
      const index = data.value.findIndex(item => item.id === id)
      if (index !== -1) {
        data.value[index] = response.data
      }
      statusCode.value = response.status
    } catch (err) {
      error.value = err.message
      throw err
    }
  }

  const deleteData = async (id) => {
    try {
      await axios.delete(`${apiUrl}/${id}`)
      data.value = data.value.filter(item => item.id !== id)
    } catch (err) {
      error.value = err.message
      throw err
    }
  }

  return {
    data,
    error,
    statusCode,
    fetchData,
    createData,
    updateData,
    deleteData
  }
}
