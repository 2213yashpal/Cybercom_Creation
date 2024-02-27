let userData = [];
let currentPage = 1;
const usersPerPage = 15;

async function fetchData() {
    try {
        const response = await fetch('https://dummyjson.com/users');
        const data = await response.json();
        userData = data.users;
        let storedUsers = JSON.parse(localStorage.getItem('users'));
        const allUsers = [...userData, ...storedUsers];

        return allUsers;
    } catch (error) {
        console.error('Error fetching user data:', error);
    }
}

function displayUserData(users) {
   

    const userTableBody = document.getElementById('user-table-body');
    userTableBody.innerHTML = ''; // Clear previous data
    users.forEach(user => {
        const row = document.createElement('tr');
        row.innerHTML = `
        <td><img src=${user.image} alt="Girl in a jacket" width="100%" height="40px"></td>
        <td>${user.id}</td>
        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.email}</td>
        <td>${user.gender}</td>
        <td>${user.birthDate}</td>
        <td>${user.phone}</td>
        `;
        userTableBody.appendChild(row);
    });

    displayPagination();
}

function searchUser() {
    const searchInput = document.getElementById('searchInput').value.trim().toLowerCase();
    const filteredUsers = userData.filter(user => user.firstName.toLowerCase().includes(searchInput));
    displayUserData(filteredUsers);
}

document.getElementById('userForm').addEventListener('submit', function(event) {
    event.preventDefault(); 
    
    const firstName = document.getElementById('firstName').value.trim();
    const lastName = document.getElementById('lastName').value.trim();
    const email = document.getElementById('email').value.trim();
    const gender = document.getElementById('gender').value;
    const birthDate = document.getElementById('birthDate').value.trim();
    const phone = document.getElementById('phone').value.trim();
    
    if (!firstName || !lastName || !email || !gender || !birthDate || !phone) {
        alert('All fields are required');
        return;
    }
    
    let storedUsers = JSON.parse(localStorage.getItem('users'));
    if (!Array.isArray(storedUsers)) {
        storedUsers = [];
    }
    
    const userId = storedUsers.length ? storedUsers[storedUsers.length - 1].id + 1 : 1;
    
    const newUser = {
        id: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        birthDate: birthDate,
        phone: phone
    };
    
    storedUsers.push(newUser);
    
    localStorage.setItem('users', JSON.stringify(storedUsers));
    
    document.getElementById('userForm').reset();

    fetchData().then(users => {
        displayUserData(users);
    });
});

window.onload = async function () {
    const users = await fetchData();
    displayUserData(users);
};
