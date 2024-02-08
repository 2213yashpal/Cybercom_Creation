const addTaskBtn = document.getElementById('btn');
const taskTextField = document.getElementById('task');
const priorityField = document.getElementById('priority');
const dueDateField = document.getElementById('dueDate');
const categoryField = document.getElementById('category');
const recordsDisplay = document.getElementById('records');

let taskArray = [];
let nextId = 0; // Initialize the ID counter

// Retrieve tasks from local storage if available
let objStr = localStorage.getItem('tasks');
if (objStr != null) {
   taskArray = JSON.parse(objStr);
   // Determine the next available ID
   nextId = taskArray.length;
}

// Display initial tasks
DisplayInfo();

// Event listener for adding a task
addTaskBtn.onclick = () => {
   const taskName = taskTextField.value.trim();
   const category = categoryField.value.trim();
   const priority = priorityField.value.trim();
   const dueDate = dueDateField.value.trim();

   // Validate all fields are filled
   if (taskName === '') {
      alert('Please add task.');
      return;
   }
   if (priority === '') {
      alert('Please add priority');
      return;
   }
   if (dueDate === '') {
      alert('Please add due dates');
      return;
   }
   if (category === '') {
      alert('Please add category');
      return;
   }

   const existingTaskId = addTaskBtn.dataset.taskId;

   if (existingTaskId) {
      // Edit existing task
      EditExistingTask(existingTaskId, taskName, category, priority, dueDate);
   } else {
      // Create new task
      AddNewTask(taskName, category, priority, dueDate);
   }

   // Clear input fields
   taskTextField.value = '';
   categoryField.value = '';
   dueDateField.value = '';
   addTaskBtn.innerText = 'Add Task';
   addTaskBtn.removeAttribute('data-task-id');
}

// Function to add a new task
function AddNewTask(taskName, category, priority, dueDate) {
   const newTask = {
      id: nextId++,
      taskName: taskName,
      category: category,
      priority: priority,
      dueDate: dueDate,
   };

   // Add new task to taskArray
   taskArray.push(newTask);

   // Save tasks to local storage and update display
      SaveInfo(taskArray);
}

// Function to edit an existing task
function EditExistingTask(id, taskName, category, priority, dueDate) {
   const index = taskArray.findIndex(task => task.id === parseInt(id));
   console.log(index);
   if (index !== -1) {
      taskArray[index].taskName = taskName;
      taskArray[index].category = category;
      taskArray[index].priority = priority;
      taskArray[index].dueDate = dueDate;

      // Save tasks to local storage and update display
      SaveInfo(taskArray);
   }
}

// Function to save tasks to local storage and update display
function SaveInfo(taskArray) {
   let str = JSON.stringify(taskArray);
   localStorage.setItem('tasks', str);
   DisplayInfo();
}

// Function to display tasks in the table
function DisplayInfo() {
   let statement = '';
   taskArray.forEach(task => {
      statement += `<tr>
           <td>${task.taskName}</td>
           <td>${task.category}</td>
           <td>${task.priority}</td>
           <td>${task.dueDate}</td>
           <td>
             <button class="btn btn-info edit-btn" data-id="${task.id}" onclick='EditTask(${task.id})'>Edit</button>
             <button class="btn btn-danger" onclick='DeleteTask(${task.id})'>Delete</button>
           </td>
         </tr>`;
   });
   recordsDisplay.innerHTML = statement;
}

// Function to edit a task
function EditTask(id) {
   const task = taskArray.find(task => task.id === id);
   console.log(task);
   taskTextField.value = task.taskName;
   priorityField.value = task.priority;
   dueDateField.value = task.dueDate;
   categoryField.value = task.category;

   // Change text of Add Task button to "Save Changes"
   addTaskBtn.innerText = 'Save Changes';
   addTaskBtn.setAttribute('data-task-id', id);
}

// Function to delete a task
function DeleteTask(id) {
   const isConfirmed = confirm("Are you sure you want to delete this task?");
   if (!isConfirmed) {
      return;
   }
   taskArray = taskArray.filter(task => task.id !== id);
   console.log(taskArray);
   SaveInfo(taskArray);
}
