const productsPerPage = 10; // Number of products to display per page
let currentPage = 1; // Current page number

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
            fetchDataAndDisplay(); // Reload products after deletion
        } else {
            const errorMessage = await response.text();
            alert(`Failed to delete product: ${errorMessage}`);
        }
    } catch (error) {
        console.error("Error deleting product:", error);
        alert("An error occurred while deleting the product. Please try again later.");
    }
}

async function searchProducts() {
    const searchInput = document.getElementById("search-input").value.trim();

    const url = `https://api.escuelajs.co/api/v1/products?title=${encodeURIComponent(searchInput)}`;

    const container = document.getElementById("product-container");
    container.innerHTML = "";

    try {
        const response = await fetch(url);
        const products = await response.json();
        if (products.length === 0) {
            alert("No products found with the given title.");
            return;
        }
        displayFilteredProducts(products); // Display filtered products
    } catch (error) {
        console.error(error);
    }
}

function editProduct(productId) {
    window.location.href = `html/updateproduct.html?id=${productId}`;
}

async function fetchDataAndDisplay() {
    try {
        const response = await fetch('https://api.escuelajs.co/api/v1/products');
        const data = await response.json();
        displayProducts(data, currentPage);
    } catch (error) {
        console.error('Error fetching product data:', error);
    }
}

function displayFilteredProducts(filteredProducts) {
    const container = document.getElementById('product-container');
    container.innerHTML = ''; // Clear previous content
    filteredProducts.forEach(product => {
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

function displayProducts(products, page) {
    const container = document.getElementById('product-container');
    container.innerHTML = ''; // Clear previous content
    
    const startIndex = (page - 1) * productsPerPage;
    const endIndex = startIndex + productsPerPage;
    const paginatedProducts = products.slice(startIndex, endIndex);

    paginatedProducts.forEach(product => {
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

    renderPagination(products.length);
}

function renderPagination(totalProducts) {
    const totalPages = Math.ceil(totalProducts / productsPerPage);
    const paginationContainer = document.getElementById('pagination');
    paginationContainer.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        const pageButton = document.createElement('button');
        pageButton.textContent = i;
        pageButton.onclick = function() {
            currentPage = i;
            fetchDataAndDisplay();
        };
        paginationContainer.appendChild(pageButton);
    }
}

async function populateCategories() {
    const categorySelect = document.getElementById("category-dropdown");

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

async function filterCategory() {
    const category = document.getElementById("category-dropdown").value;

    let url = `https://api.escuelajs.co/api/v1/products`;

    // Append category to the URL if selected
    if (category) {
        url += `?categoryId=${category}`;
    }

    const container = document.getElementById("product-container");
    container.innerHTML = "";

    try {
        const response = await fetch(url);
        const products = await response.json();
        displayFilteredProducts(products); // Display filtered products
    } catch (error) {
        console.error(error);
    }
}

document.getElementById("category-dropdown").addEventListener("change", filterCategory);


window.onload = function() {
    fetchDataAndDisplay();
};
