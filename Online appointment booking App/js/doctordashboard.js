document.addEventListener("DOMContentLoaded", function() {
    displayAppointments();
});

function displayAppointments() {
    var appointmentsList = document.getElementById("appointmentsList");

    const doctor = localStorage.getItem("currentdoctor");

    var appointments = JSON.parse(localStorage.getItem('appointments')) || [];

    appointmentsList.innerHTML = "";

    appointments.forEach(function(appointment, index) {
        var appointmentDiv = document.createElement("div");
        appointmentDiv.classList.add("appointment");

        var statusClass = appointment.status === "Pending" ? "pending" : appointment.status === "Approved" ? "approved" : "rejected";

        appointmentDiv.innerHTML = `
            <p>Patient Name: ${appointment.patientName}</p>
            <p>Date: ${appointment.date}</p>
            <p>Time: ${appointment.timeSlot}</p>
            <p>Status: <span class="${statusClass}">${appointment.status}</span></p>
            <button class="approve-btn" onclick="approveAppointment(${index})">Approve</button>
            <button class="reschedule-btn" onclick="showRescheduleForm(${index})">Reschedule</button>
            <button class="reject-btn" onclick="rejectAppointment(${index})">Reject</button>
        `;

        appointmentsList.appendChild(appointmentDiv);
    });
}

function approveAppointment(index) {
    var appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    appointments[index].status = "Approved";
    localStorage.setItem('appointments', JSON.stringify(appointments));
    displayAppointments();
}

function rejectAppointment(index) {
    var appointments = JSON.parse(localStorage.getItem('appointments')) || [];
    appointments[index].status = "Rejected";
    localStorage.setItem('appointments', JSON.stringify(appointments));
    appointments.splice(index, 1);
    localStorage.setItem('appointments', JSON.stringify(appointments));
    displayAppointments();
}

function showRescheduleForm(index) {
    var formHtml = `
        <div id="rescheduleForm">
            <label for="newDate">New Date:</label>
            <input type="date" id="newDate">
            <label for="newTime">New Time:</label>
            <input type="time" id="newTime">
            <button onclick="rescheduleAppointment(${index})">Reschedule</button>
        </div>
    `;
    document.getElementById("appointmentsList").innerHTML += formHtml;
}

function rescheduleAppointment(index) {
    var newDate = document.getElementById("newDate").value;
    var newTime = document.getElementById("newTime").value;
    if (newDate && newTime) {
        var appointments = JSON.parse(localStorage.getItem('appointments')) || [];
        appointments[index].date = newDate;
        appointments[index].timeSlot = newTime;
        localStorage.setItem('appointments', JSON.stringify(appointments));
        displayAppointments();
    } else {
        alert("Please enter valid date and time for rescheduling.");
    }
}

function logout() {
    localStorage.removeItem('currentdoctor');
    localStorage.removeItem('username');
    localStorage.removeItem('userType');
    window.location.href = "login.html";
}

document.getElementById("logout-btn").addEventListener("click", logout);
