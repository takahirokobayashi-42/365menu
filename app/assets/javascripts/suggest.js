$( function() {
  $( '.suggest' ).autocomplete({
      autoFocus: true,  //テキストフィールドの値をフォーカスされたアイテムの値で置き換える
      source: "/admins/master_dishes/auto_complete.json",  //サジェストのデータを呼び出す
      minLength: 1  //オートコンプリートが動作する文字数を指定
  });
});

// 上記の記述だけだとすでに存在しているsuggestにしか反応しない！そのためcocoon:after-insertで動的フォームに追加した際に反応するように記述　
 $(function(){
   $('#tasks').on('cocoon:after-insert', function(e, added_task) {
     $( '.suggest' ).autocomplete({
       autoFocus: true,  
       source: "/admins/master_dishes/auto_complete.json", 
       minLength: 1  
     });
   });
 });