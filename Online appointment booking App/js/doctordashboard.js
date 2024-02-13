document.addEventListener("DOMContentLoaded", function() {
    displayAppointments();
});

function displayAppointments() {
    var appointmentsList = document.getElementById("appointmentsList");

    
    var appointments = JSON.parse(localStorage.getItem('appointments')) || [];

    appointmentsList.innerHTML = "";

    appointments.forEach(function(appointment, index) {
        var appointmentDiv = document.createElement("div");
        appointmentDiv.classList.add("appointment");

        var statusClass = appointment.status === "Pending" ? "pending" : appointment.status === "Approved" ? "approved" : "rejected";

        appointmentDiv.innerHTML = `
            <p>Patient Name :${appointment.patientName}</p>
            <p>Date & Time: ${formatDateTime(appointment.timeSlot)}</p>
            <p>Status: <span class="${statusClass}">${appointment.status}</span></p>
            <button class="approve-btn" onclick="approveAppointment(${index})">Approve</button>
            <button class="reject-btn" onclick="rejectAppointment(${index})">Reject</button>
        `;

        appointmentsList.appendChild(appointmentDiv);
    });
}

function formatDateTime(dateTimeStr) {
    var dateTime = new Date(dateTimeStr);
    return dateTime.toLocaleString();
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

