$( function() {
  $( '.suggest' ).autocomplete({
      autoFocus: true,  //テキストフィールドの値をフォーカスされたアイテムの値で置き換える
      source: "/admins/master_dishes/auto_complete.json",  //サジェストのデータを呼び出す
      minLength: 1  //オートコンプリートが動作する文字数を指定
  });
});