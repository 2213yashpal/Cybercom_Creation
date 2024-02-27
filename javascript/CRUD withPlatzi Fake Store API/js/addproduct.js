// Function to add a product
async function addProduct() {
    const categoryId = document.getElementById("categoryId").value;
    const title = document.getElementById("title").value;
    const price = document.getElementById("price").value;
    const description = document.getElementById("description").value;
    const imagesInput = document.getElementById("images");
    const images = imagesInput.value.split(",");

    const url = "https://api.escuelajs.co/api/v1/products/";

    try {
        const response = await fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                categoryId,
                title,
                images,
                price,
                description
            })
        });

        if (response.ok) {
            alert("Product added successfully!");
            clearFormFields();
        } else {
            const errorMessage = await response.text();
            alert(`Failed to add product: ${errorMessage}`);
        }
    } catch (error) {
        console.error("Error adding product:", error);
        alert("An error occurred while adding the product. Please try again later.");
    }
}

// Function to clear form fields
function clearFormFields() {
    document.getElementById("categoryId").value = "";
    document.getElementById("title").value = "";
    document.getElementById("images").value = "";
    document.getElementById("price").value = "";
    document.getElementById("description").value = "";
}

// Event listener for form submission
document.getElementById("add-product-form").addEventListener("submit", function (event) {
    event.preventDefault();
    addProduct();
});

async function populateCategories() {
    const categorySelect = document.getElementById("categoryId");

    try {
        const response = await fetch("https://api.escuelajs.co/api/v1/categories");
        const categories = await response.json();

        categories.forEach(category => {
            const option = document.createElement("option");
            option.value = category.id;
            option.textContent = category.name;
            categorySelect.appendChild(option);
        });
    } catch (error) {
        console.error("Error fetching categories:", error);
    }
}

populateCategories();
