// $(document).ready(function() {
//   // スライド記述
//   $(function() {
//     // スクロールの方向 -1のときは左、 1の時は右
//     let dir = -1;
  
//     // スクロールのインターバル
//     const interval = 7000;
  
//     // スクロールのスピード
//     const duration = 200;
  
//     // バナーの順番を変更
//     $("#slide ul").prepend($("#slide li:last-child"));
  
//     // バナーの位置を変更（１つ分ずらす）
//     $("#slide ul").css("left", -1000)

//     // 
//     timer = setInterval(slideTimer, interval);

//     // slideTimer関数
//     function slideTimer() {
//       // スクロール方向の判断
//       if(dir == -1) {
//         // バナー１つ分スクロール
//         $("#slide ul").animate({"left" : "-=1000px" }, duration,
//         function() {
//           // リストの順番を変更
//           $(this).append($("#slide li:first-child"));
  
//           // リストの位置を変更
//           $(this).css("left", -1000);
//         });
//       } else {
//         // バナー１つ分右にスクロール
//         $("#slide ul").animate({"left" : "+=1000px" }, duration,
//         function() {
//           // リストの順番を変更
//           $(this).append($("#slide li:last-child"));
  
//           // リストの位置を変更
//           $(this).css("left", -1000);

//           // 左方向へセット
//           dir = -1;
//         });
//       }
//     }
  
//     // 戻るボタン
//     $("#prevBtn").click(function() {
//       dir = 1;

//       // タイマーを停止して再スタート
//       clearInterval(timer);
//       timer = setInterval(slideTimer, interval);

//       //初回の関数実行
//       slideTimer();
//     });
  
//     // 進むボタン
//     $("#nextBtn").click(function() {
//       dir = -1;

//        // タイマーを停止して再スタート
//        clearInterval(timer);
//        timer = setInterval(slideTimer, interval);

//        //初回の関数実行
//       slideTimer();
//     })
//   });
// });
