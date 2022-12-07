const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); //環境変数の読み込み
  const submit = document.getElementById("button");
  submit.addEventListener('click', (e) => {
    e.preventDefault();

    // カード情報の取得先
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = { //カードオブジェクトの作成
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`
    };

    // カード情報をPAY.JPに送信する処理
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='card_token' type='hidden'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
    // カード情報をPAY.JPに送信する処理
  });
};

window.addEventListener("load", pay);