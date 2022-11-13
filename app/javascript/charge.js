function charge(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const price = priceInput.value;
    const commission = document.getElementById("add-tax-price");
    const commissionCalc = Math.floor(price * 0.1)
    commission.innerHTML = commissionCalc
    const profit = document.getElementById("profit");
    profit.innerHTML = `${price - commissionCalc}`;
  })
};

window.addEventListener('load',charge);