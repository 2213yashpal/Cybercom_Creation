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
    const timeSlot = document.getElementById("timeSlot").value;
    const patientName = localStorage.getItem("currentUser");

    if (!doctor || !timeSlot) {
        alert("Please select a doctor and enter a preferred time slot.");
        return;
    }

    const appointment = {
        doctor: doctor,
        timeSlot: timeSlot,
        patientName: patientName
    };

    // Save appointment to localStorage
    const appointments = JSON.parse(localStorage.getItem("appointments")) || [];
    appointments.push(appointment);
    localStorage.setItem("appointments", JSON.stringify(appointments));

    alert("Appointment booked successfully!");

    // Reset form fields
    document.getElementById("appointmentForm").reset();
}

window.onload = displayAvailableDoctors;

document.getElementById("appointmentForm").addEventListener("submit", bookAppointment);
