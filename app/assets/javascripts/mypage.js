//= require jquery3
//= require popper
//= require rails-ujs
//= require bootstrap-material-design/dist/js/bootstrap-material-design.js

function previewFileWithId(selector) {
  // 発火元の要素を保持する(filesプロパティ？)
  const target = this.event.target;
  // targetの1つめのファイルオブジェクトを取り出す
  const file = target.files[0];
  const reader  = new FileReader();
  // ファイルの読み込みが終了した時に
  reader.onloadend = function () {
    // 直前に取得したデータをsrc属性に入れてる？
      selector.src = reader.result;
  }
  // 画像が読み込まれたら発火する
  if (file) {
      reader.readAsDataURL(file);
  } else {
      selector.src = "";
  }
}