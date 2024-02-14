document.getElementById("login-btn").addEventListener('click', function(event) {
    event.preventDefault(); // Prevent form submission

    // Get input values
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    // Validate username and password
    if (username.trim() === '') {
        showError("Please enter your username.", "usernameError");
        return;
    } else {
        hideError("usernameError");
    }

    if (password.trim() === '') {
        showError("Please enter your password.", "passwordError");
        return;
    } else {
        hideError("passwordError");
    }

    // Retrieve registrations from local storage
    function getRegistrations() {
        return JSON.parse(localStorage.getItem('registrations')) || [];
    }

    var registrations = getRegistrations();

    // Find user in registrations array
    var user = registrations.find(function(registration) {
        return registration.username === username && registration.password === password;
    });

    // Check if user exists
    if (!user) {
        showError("user is not registered.", "errorElement");
        clearInputFields();
        return;
    }

    if (user.userType === 'patient') {
        localStorage.setItem("currentUser", username);
        window.location.href = 'patientdashboard.html';
    } else if (user.userType === 'doctor') {    
        localStorage.setItem("currentdoctor", username);
        window.location.href = 'doctordashboard.html';
    }
});

document.getElementById("reg-btn").addEventListener('click', function() {
    window.location.href = "register.html"; // Redirect to registration page
});

function showError(message, elementId) {
    var errorElement = document.getElementById(elementId);
    errorElement.textContent = message;
    errorElement.style.display = 'block';
}

function hideError(elementId) {
    var errorElement = document.getElementById(elementId);
    errorElement.textContent = "";
    errorElement.style.display = 'none';
}

function clearInputFields() {
    document.getElementById("username").value = "";
    document.getElementById("password").value = "";
}
