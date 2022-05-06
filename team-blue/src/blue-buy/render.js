function getPrice(sku) {
  let _price = '0,00 €'
  // DB
  const prices = {
    t_porsche: '66,00 €',
    t_fendt: '54,00 €',
    t_eicher: '58,00 €',
  };
  _price = prices[sku]
  return _price
}

export default function renderBuy(sku = 't_porsche') {
  const price = getPrice(sku);
  return `<button type="button">buy for ${price}</button>`;
}
