// 関数宣言
function price() {
  // 価格に関するHTMLの要素を取得
  const priceInput = document.getElementById("item-price");
  // 販売手数料に関するHTMLの要素を取得
  const addTax = document.getElementById("add-tax-price");
  // 販売利益に関するHTMLの要素を取得
  const profit = document.getElementById("profit");
  // ユーザーが価格入力のキーを入力した時点でkeyupイベント発火
    priceInput.addEventListener("keyup", () => {
      // 入力された価格の値を変数valueへ代入
      const value = priceInput.value;
      // 条件分岐でtrueであれば、手数料・利益の値を計算し代入
      if (300 <= value && value <= 9999999){
        // 小数点切り捨て
        let fee = Math.floor(value * 0.1)
        let gain = Math.floor(value * 0.9)
        // 3桁ごとにカンマ区切り
        addTax.innerHTML = fee.toLocaleString();
        profit.innerHTML = gain.toLocaleString();
      } else {
        // falseであれば、0円を表示
        let fee = 0;
        let gain = 0;
        addTax.innerHTML = fee;
        profit.innerHTML = gain;
      }
    });
}
// window.addEventListener("load", price);
// １秒毎にpriceを実行
setInterval(price, 1000);