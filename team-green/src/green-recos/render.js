function getReco(sku){
  let _reco = [];
  const recos = {
    t_porsche: ['3', '5', '6'],
    t_fendt: ['3', '6', '4'],
    t_eicher: ['1', '8', '7'],
  };
  return _reco= recos[sku];
}


export default function renderRecos(sku = 't_porsche') {
  const reco = getReco(sku);
  console.log(reco);
  return `
    <h3>Related Products</h3>
    ${reco.map((id) => `<img src="./green/images/reco_${id}.jpg" alt="Reco ${id}" />`).join('')}
  `;
}
