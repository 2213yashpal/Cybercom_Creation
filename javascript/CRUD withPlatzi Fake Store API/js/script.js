async function deleteProduct(productId) {
    const confirmDelete = confirm("Are you sure you want to delete this product?");
    if (!confirmDelete) {
        return; 
    }

    const url = `https://api.escuelajs.co/api/v1/products/${productId}`;

    try {
        const response = await fetch(url, {
            method: "DELETE"
        });

        if (response.ok) {
            alert("Product deleted successfully!");
            fetchData(); // Reload products after deletion
        } else {
            const errorMessage = await response.text();
            alert(`Failed to delete product: ${errorMessage}`);
        }
    } catch (error) {
        console.error("Error deleting product:", error);
        alert("An error occurred while deleting the product. Please try again later.");
    }
}

// Function to display products
function displayProducts(products) {
    const container = document.getElementById('product-container');
    container.innerHTML = ''; // Clear previous content
    products.forEach(product => {
        const card = document.createElement('div');
        card.classList.add('card');
        card.innerHTML = `
            <img src="${product.image}" alt="${product.title}">
            <h3>${product.title}</h3>
            <p>${product.price}</p>
            <p>${product.description}</p>
            <button onclick="editProduct(${product.id})">Edit</button>
            <button onclick="deleteProduct(${product.id})">Delete</button>
        `;
        container.appendChild(card);
    });
}

function editProduct(productId) {
    window.location.href = `html/updateproduct.html?id=${productId}`;
}

// Function to fetch data
async function fetchData() {
    try {
        const response = await fetch('https://api.escuelajs.co/api/v1/products');
        const data = await response.json();
        displayProducts(data);
    } catch (error) {
        console.error('Error fetching product data:', error);
    }
}

// Call fetchData on page load
window.onload = fetchData;
