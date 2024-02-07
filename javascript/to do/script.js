const addTaskBtn = document.getElementById('btn');
const btnText = addTaskBtn.innerText;
const taskTextField = document.getElementById('task');
const recordsDisplay = document.getElementById('records');

let taskArray = [];
let edit_id = null;

let objStr = localStorage.getItem('tasks');

if (objStr != null) {
   taskArray = JSON.parse(objStr);
}

DisplayInfo();

addTaskBtn.onclick = () => {
   //get task name from text field
   const taskName = taskTextField.value;
   if (edit_id != null) {
      //edit action
      taskArray.splice(edit_id, 1, {
         'taskName': taskName
      });
      edit_id = null;
   } else {
      //insert action
      taskArray.push({
         'taskName': taskName
      });
   }

   SaveInfo(taskArray);
   taskTextField.value = '';
   addTaskBtn.innerText = btnText;
}

// store user's name in local storage
function SaveInfo(taskArray) {
   let str = JSON.stringify(taskArray);
   localStorage.setItem('tasks', str);
   DisplayInfo();
}

// display user's name
function DisplayInfo() {
   let statement = '';
   taskArray.forEach((task, i) => {
      statement += `<tr>
           <th scope="row">${i+1}</th>
           <td>${task.taskName}</td>
           <td><i class="btn text-white fa fa-edit btn-info mx-2" onclick='EditInfo(${i})'></i> <i class="btn btn-danger text-white fa fa-trash" onclick='DeleteInfo(${i})'></i></td>
         </tr>`;
   });
   recordsDisplay.innerHTML = statement;
}

// edit user's name
function EditInfo(id) {
   edit_id = id;
   taskTextField.value = taskArray[id].taskName;
   addTaskBtn.innerText = 'Save Changes';
}

//delete user's name
function DeleteInfo(id) {
   taskArray.splice(id, 1);
   SaveInfo(taskArray);

}