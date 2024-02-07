const products = [
    {
        name: 'Product 1',
        image: '/assets/images/p2.jpeg',
        price: 20.99,
        quantity: 0
    },
    {
        name: 'Product 2',
        image: '/assets/images/p2.jpeg',
        price: 15.49,
        quantity: 0
    },
    {
        name: 'Product 3',
        image: '/assets/images/p2.jpeg',
        price: 25.99,
        quantity: 0
    },
];

function renderProductList() {
    const productListDiv = document.getElementById('productList');

    products.forEach(product => {
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
        priceTag.textContent = '$' + product.price.toFixed(2);

        const quantityDiv = document.createElement('div');
        quantityDiv.classList.add('quantity');

        const decreaseButton = document.createElement('button');
        decreaseButton.textContent = '-';
        decreaseButton.addEventListener('click', () => {
            if (product.quantity > 0) {
                product.quantity--;
                quantityTag.textContent = product.quantity;
            }
        });

        const quantityTag = document.createElement('p');
        quantityTag.textContent = product.quantity;

        const increaseButton = document.createElement('button');
        increaseButton.textContent = '+';
        increaseButton.addEventListener('click', () => {
            product.quantity++;
            quantityTag.textContent = product.quantity;
        });

        quantityDiv.appendChild(decreaseButton);
        quantityDiv.appendChild(quantityTag);
        quantityDiv.appendChild(increaseButton);

        detailsDiv.appendChild(nameTag);
        detailsDiv.appendChild(priceTag);
        detailsDiv.appendChild(quantityDiv);

        productDiv.appendChild(imageTag);
        productDiv.appendChild(detailsDiv);

        productListDiv.appendChild(productDiv);
    });
}

document.getElementById('btn').addEventListener('click',()=>{

    localStorage.setItem('cart', JSON.stringify(products));
    window.location.href = 'checkout.html';

})

// function checkout() {

//     localStorage.setItem('cart', JSON.stringify(products));

//     window.location.href = 'checkout.html';
// }

renderProductList();