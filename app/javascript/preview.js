document.addEventListener('DOMContentLoaded', function (){
  // 新規投稿・編集ページのフォーム取得
  const postForm = document.getElementsByClassName('items-sell-main');
  // プレビュー表示のためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがなければここで処理が終了
  if (!postForm) return null;
  // 画像投稿枚数の制限を定義
  const imageLimits = 5;
  
  // プレビュー画像を生成・表示する関数
  const buildPreviewImage = (dataIndex, blob) => {
    // 画像表示のためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    previewWrapper.setAttribute('data-index', dataIndex);

    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);

    // 削除ボタンを生成
    const deleteButton = document.createElement('div');
    deleteButton.setAttribute("class", "image-delete-button");
    deleteButton.innerText = "削除";

    // 削除ボタンをクリックしたらプレビューとfile_fieldを削除
    deleteButton.addEventListener('click', () => deleteImage(dataIndex));

    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewWrapper.appendChild(deleteButton);
    previewList.appendChild(previewWrapper);
  };

  // file_fieldを生成・表示する関数
  const buildNewFileField = () => {
    // ２枚目用のfile_fieldを作成
    const newFileField = document.createElement('input');
    newFileField.setAttribute('type', 'file');
    newFileField.setAttribute('name', 'item[images][]');

    // 最後のfile_fieldを取得
    const lastFileField = document.querySelector('input[type="file"][name="item[images][]"]:last-child');
    const nextDataIndex = Number(lastFileField.getAttribute('data-index'))+1;
    newFileField.setAttribute('data-index', nextDataIndex);

    // 追加されたfile_fieldにchangeイベントをセット
    newFileField.addEventListener('change', changedFileField);

    // 生成したfile_fieldを表示
    const fileFieldsArea = document.querySelector('.click-upload');
    fileFieldsArea.appendChild(newFileField);
  };

  // 指定したdata-indexを持つプレビューとfile_fieldを削除
  const deleteImage = (dataIndex) => {
    const deletePreviewImage = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    deletePreviewImage.remove();
    const deleteFileField = document.querySelector(`input[type="file"][data-index="${dataIndex}"]`);
    deleteFileField.remove();

    // 画像の枚数が最大の時に削除ボタンを押した場合、file_fieldを１つ追加
    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount == imageLimits - 1) buildNewFileField();
  };

  // input要素で値の変化が起きた時に呼び出される関数の中身
  const changedFileField = (e) => {
    // data-index（何番目を操作しているのか）を取得
    const dataIndex = e.target.getAttribute('data-index');

    const file = e.target.files[0];

    // fileが空＝何も選択しなかった　ということなのでプレビュー等を削除して終了
    if (!file){
      deleteImage(dataIndex);
      return null;
    };

    const blob = window.URL.createObjectURL(file);

    // data-indexを利用し、すでにプレビューが表示されているか確認
    const alreadyPreview = document.querySelector(`.preview[data-index="${dataIndex}"]`);
    if (alreadyPreview){
      // クリックしたfile_fieldのdata-indexと同じ番号のプレビュー画像がすでに表示されている場合は、画像の差し替えのみ実施
      const alreadyPreviewImage = alreadyPreview.querySelector('img');
      alreadyPreviewImage.setAttribute("src", blob);
      return null;
    };

    buildPreviewImage(dataIndex, blob);

    // 画像の枚数制限を超えなければ、新しいfile_fieldを追加
    const imageCount = document.querySelectorAll(".preview").length;
    if (imageCount < imageLimits) buildNewFileField();
  };

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[images][]"]');

  // input要素で値の変化が起きた時に呼び出される関数
  fileField.addEventListener('change', changedFileField);
});