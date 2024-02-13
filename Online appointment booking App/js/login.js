document.getElementById("login-btn").addEventListener('click', function(event) {
    event.preventDefault(); // Prevent form submission

    // Get input values
    let username = document.getElementById("username").value;
    let password = document.getElementById("password").value;

    // Validate username and password
    if (username.trim() === '') {
        document.getElementById("usernameError").textContent = "Please enter your username.";
    } else {
        document.getElementById("usernameError").textContent = "";
    }

    if (password.trim() === '') {
        document.getElementById("passwordError").textContent = "Please enter your password.";
    } else {
        document.getElementById("passwordError").textContent = "";
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
        showError('Invalid username or password.');
        return;
    }

    localStorage.setItem("currentUser", username);


    if (user.userType === 'patient') {
        window.location.href = 'patientdashboard.html';
    } else if (user.userType === 'doctor') {    
        window.location.href = 'doctordashboard.html';
    }
});

document.getElementById("reg-btn").addEventListener('click', function() {
    window.location.href = "register.html"; // Redirect to registration page
});
