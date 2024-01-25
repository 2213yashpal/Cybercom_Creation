function calculateBMI() {
    const heightInput = document.getElementById("height");
    const weightInput = document.getElementById("weight");
    const resultDiv = document.getElementById("result");
    const heightError = document.getElementById("heightError");
    const weightError = document.getElementById("weightError");

    heightError.textContent = "";
    weightError.textContent = "";

    const height = parseFloat(heightInput.value);
    const weight = parseFloat(weightInput.value);

    if (isNaN(height) || height <= 0) {
      heightError.textContent = "Please enter a valid height";
      return;
    }

    if (isNaN(weight) || weight <= 0) {
      weightError.textContent = "Please enter a valid  weight ";
      return;
    }

    const bmi = weight / (height * height);
    const bmiCategory = getBMICategory(bmi);

    resultDiv.innerHTML = `Your BMI: ${bmi.toFixed(2)} - ${bmiCategory}`;
  }

  function getBMICategory(bmi) {
    if (bmi < 18.5) {
      return "Underweight";
      resultDiv.className = "underweight";
    } else if (bmi < 25) {
      return "Normal weight";
      resultDiv.className = "normal";

    } else if (bmi < 30) {
      return "Overweight";
      resultDiv.className = " overweight ";

    } else {
      return "Obese";
      resultDiv.className = "obese ";

    }
  }
