
const storedProducts = JSON.parse(localStorage.getItem('cart'));

function renderCheckoutList() {
    const checkoutListDiv = document.getElementById('checkoutList');
    let totalPrice = 0;

    const filteredProducts = storedProducts.filter(product => product.quantity > 0);


    filteredProducts.forEach(product => {
        const productDiv = document.createElement('div');
        productDiv.classList.add('product');

        const imageTag = document.createElement('img');
        imageTag.src = product.image;
        imageTag.alt = product.name;

        const detailsDiv = document.createElement('div');
        detailsDiv.classList.add('product-details');

        const nameTag = document.createElement('h3');
        nameTag.textContent = product.name;

        const priceTag = document.createElement('p');
        priceTag.classList.add('price');
        priceTag.textContent = '$' + (product.price * product.quantity).toFixed(2);



        const quantityTag = document.createElement('p');
        quantityTag.textContent = 'Quantity: ' + product.quantity;

        detailsDiv.appendChild(nameTag);
        detailsDiv.appendChild(priceTag);
        detailsDiv.appendChild(quantityTag);

        productDiv.appendChild(imageTag);
        productDiv.appendChild(detailsDiv);

        checkoutListDiv.appendChild(productDiv);

        totalPrice += product.price * product.quantity;
    });

    const totalPriceTag = document.getElementById('totalPrice');
    totalPriceTag.textContent = 'Total Price: $' + totalPrice.toFixed(2);
}

function backtocart() {
    window.location.href = 'cart.html';
}


renderCheckoutList();
