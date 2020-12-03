// jQueryの関数で予約状態としてHTMLの読み込みが終了したら実行される。
$(function() {
  new Swiper('.swiper-container', {
      pagination: {
          el: '.swiper-pagination',
      },
  })
})