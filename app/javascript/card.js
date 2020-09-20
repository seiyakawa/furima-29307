const pay = () => {
  // ②PAY.JPテスト公開鍵設定 呼び出し
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // ③idであるcharge-formを元に要素を取得し、変数formに代入
  const form = document.getElementById("charge-form");
  // ④charge-form内のsubmitが実行されるとイベント発火
  form.addEventListener("submit", (e) => {
    // ⑤railsのフォーム送信処理をキャンセル
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    // ⑥入力されたカードの情報を変数cardに代入
    const card = {
      number: formData.get("order_address[number]"),
      cvc: formData.get("order_address[cvc]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
    };
    console.log(card)
    // ⑦PAY.JPにアクセスして、トークンを作成
    Payjp.createToken(card, (status, response) => {
      // ⑧HTTPステータスコードが200であった場合つまりトークンを作成出来た場合実行
      if (status == 200) {
        // ⑨生成されたトークンを変数に代入
        const token = response.id;
        // ⑩生成する要素を取得
        const renderDom = document.getElementById("charge-form");
        // ⑪トークンの値が入っているHTML定義
        const tokenObj = `<input value=${token} type="hidden" name='order_address[token]'>`;
        // ⑫生成する処理
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // ⑬入力されたカード情報がパラメーターとして送られないように削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      // ⑭フォームに記載されている情報をサーバーサイドへ送信
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
//  ①ページがロードされるとpayという関数が呼び出し
 window.addEventListener("load", pay);