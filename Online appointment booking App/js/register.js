document.getElementById("registrationForm").addEventListener('submit', function(event) {
    event.preventDefault(); 
    
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;
    let confirmPassword = document.getElementById("confirmPassword").value;
    let userType = document.getElementById("userType").value;

    let isValid = true; 
    
    if (username.trim() === '') {
        document.getElementById("usernameError").textContent = "Please enter a username.";
        isValid = false;
    } else {
        document.getElementById("usernameError").textContent = "";
    }

    if (password.trim() === '') {
        document.getElementById("passwordError").textContent = "Please enter a password.";
        isValid = false;
    } else {
        document.getElementById("passwordError").textContent = "";
    }

    if (confirmPassword.trim() === '') {
        document.getElementById("confirmPasswordError").textContent = "Please confirm your password.";
        isValid = false;
    } else if (confirmPassword !== password) {
        document.getElementById("confirmPasswordError").textContent = "Passwords do not match.";
        isValid = false;
    } else {
        document.getElementById("confirmPasswordError").textContent = "";
    }

    if (userType.trim() === '') {
        document.getElementById("userTypeError").textContent = "Please select a user type.";
        isValid = false;
    } else {
        document.getElementById("userTypeError").textContent = "";
    }

    if (isValid) {
        var registrations = JSON.parse(localStorage.getItem('registrations')) || [];
        var nextId = registrations.length; // Next ID is the current length of the registrations array

        if (registrations.some(registration => registration.username === username && registration.userType === userType)) {
            showError('Username already exists.');
            return;
        }

        registrations.push({ id: nextId, username: username, password: password, userType: userType });

        localStorage.setItem('registrations', JSON.stringify(registrations));

        alert('Registration successful');
        window.location.href = 'login.html';

    }
});

function showError(message) {
    alert(message);
}
