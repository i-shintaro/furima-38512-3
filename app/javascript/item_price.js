const price = () => {
  // 価格
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    // 販売手数料 (10%)実装
    const taxRate = 0.1;
    const taxPrice = Math.floor(inputValue * taxRate);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${taxPrice}`;
    // 販売利益
    const profit = document.getElementById("profit");
    const profitValue = Math.floor(inputValue - taxPrice);
    profit.innerHTML = `${profitValue}`;
  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
// 一度商品の出品に失敗しrenderメソッドによりビューが表示された直後も価格計算のjavascriptが正常に動く様になります。


// window.addEventListener('turbo:load', () => {
//   const priceInput = document.getElementById("item-price")
//   priceInput.addEventListener("input", () => {
//     const inputValue = priceInput.value;
//     const taxRate = 0.1
//     const taxPrice = Math.floor(inputValue * taxRate)
//     const addTaxDom = document.getElementById("add-tax-price");
//     addTaxDom.innerHTML = `${taxPrice}`;

//     const profit = document.getElementById("profit")
//     const profitValue = inputValue - taxPrice;
//     profit.innerHTML = `${profitValue}`;
//   })
// });

