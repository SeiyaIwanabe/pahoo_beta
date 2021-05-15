$(document).ready(function() {

  // pahooの左端の座標
  const pahoo_left_edge = document.getElementById('pahoo').getBoundingClientRect().left;
  const pahoo_right_edge = document.getElementById('pahoo').getBoundingClientRect().right;
  


  //スクロールしたら要素が出現
  const targetElement = document.querySelectorAll(".bannerContent");
  console.log(targetElement);
  document.querySelector('.bannerArea').addEventListener("scroll", function() {
    for (let i = 0; i < targetElement.length; i++) {
      const target_left_edge =  targetElement[i].getBoundingClientRect().left;
      const target_right_edge =  targetElement[i].getBoundingClientRect().right;

      if(target_left_edge > pahoo_left_edge && target_right_edge < pahoo_right_edge) {
        targetElement[i].classList.add("show");
      } else {
        targetElement[i].classList.remove("show");
      }
    };
  })
});