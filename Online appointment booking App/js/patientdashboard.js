function getAvailableDoctors() {
    const registrations = JSON.parse(localStorage.getItem("registrations")) || [];
    return registrations.filter(registration => registration.userType === "doctor");
}

function displayAvailableDoctors() {
    const doctors = getAvailableDoctors();
    const doctorSelect = document.getElementById("doctor");

    doctors.forEach((doctor) => {
        const option = document.createElement("option");
        option.value = doctor.username;
        option.textContent = doctor.username;
        doctorSelect.appendChild(option);
    });
}

function bookAppointment(event) {
    event.preventDefault();

    const doctor = document.getElementById("doctor").value;
    const date = document.getElementById("date").value;
    const timeSlot = document.getElementById("timeSlot").value;
    const patientName = localStorage.getItem("currentUser");
    const status="pending";

    if (!doctor || !timeSlot) {
        alert("Please select a doctor and enter a preferred time slot.");
        return;
    }

    const appointment = {
        doctor: doctor,
        date:date,
        timeSlot: timeSlot,
        patientName: patientName,
        status:status
    };

    // Save appointment to localStorage
    const appointments = JSON.parse(localStorage.getItem("appointments")) || [];
    appointments.push(appointment);
    localStorage.setItem("appointments", JSON.stringify(appointments));

    alert("Appointment booked successfully!");

    // Reset form fields
    document.getElementById("appointmentForm").reset();

    // Update displayed appointments
    displayPatientAppointments();
}


function displayPatientAppointments() {
    var appointmentsList = document.getElementById("appointmentsList");

    var appointments = JSON.parse(localStorage.getItem('appointments')) || [];

    appointmentsList.innerHTML = "";

    appointments.forEach(function(appointment) {
        var appointmentDiv = document.createElement("div");
        appointmentDiv.classList.add("appointment");

        var statusClass = appointment.status === "Pending" ? "pending" : appointment.status === "Approved" ? "approved" : "rejected";

        appointmentDiv.innerHTML = `
            <p>Doctor Name: ${appointment.doctor}</p>
            <p>Date: ${appointment.date}</p>
            <p>Time: ${appointment.timeSlot}</p>
            <p>Status: <span class="${statusClass}">${appointment.status}</span></p>
        `;

        appointmentsList.appendChild(appointmentDiv);
    });

}
window.onload = function() {
    displayAvailableDoctors();
    displayPatientAppointments(); // Display patient's appointments when the page loads
};

document.getElementById("appointmentForm").addEventListener("submit", bookAppointment);

function logout(){
    localStorage.removeItem('currentUser');
    localStorage.removeItem('username');
    localStorage.removeItem('userType');

    window.location.href="login.html";

}
document.getElementById("logout-btn").addEventListener("click", logout);
