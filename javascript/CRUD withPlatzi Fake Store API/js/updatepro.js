// Function to fetch product details by ID
async function fetchProduct(productId) {
    const url = `https://api.escuelajs.co/api/v1/products/${productId}`;

    try {
        const response = await fetch(url);
        const data = await response.json();
        return data; // Assuming the response contains product details
    } catch (error) {
        console.error("Error fetching product details:", error);
        return null;
    }
}

// Function to populate form fields with product details
async function populateForm(productId) {
    const product = await fetchProduct(productId);

    if (product) {
        document.getElementById("product-id").value = product.id;
        document.getElementById("title").value = product.title;
        // document.getElementById("images").value = product.image;
        document.getElementById("price").value = product.price;
        document.getElementById("description").value = product.description;
    } else {
        alert("Product not found!");
    }
}

// Get product ID from URL query parameter
const urlParams = new URLSearchParams(window.location.search);
const productId = urlParams.get('id');

// Populate form with product details on page load
window.onload = function() {
    if (productId) {
        populateForm(productId);
    } else {
        alert("Product ID is missing in the URL!");
    }
};

async function updateProduct(event) {
    event.preventDefault();

    const productId = document.getElementById("product-id").value;
    const title = document.getElementById("title").value;
    // const images = document.getElementById("images").value;
    const price = document.getElementById("price").value;
    const description = document.getElementById("description").value;

    const url = `https://api.escuelajs.co/api/v1/products/${productId}`;

    try {
        const response = await fetch(url, {
            method: "PUT",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                
                title,
                // image: images,
                price,
                description
            })
        });

        if (response.ok) {
            alert("Product updated successfully!");
        } else {
            const errorMessage = await response.text();
            alert(`Failed to update product: ${errorMessage}`);
        }
    } catch (error) {
        console.error("Error updating product:", error);
        alert("An error occurred while updating the product. Please try again later.");
    }
}

// Add event listener to form submission
document.getElementById("update-product-form").addEventListener("submit", updateProduct);
