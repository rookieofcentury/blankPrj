const links = document.querySelectorAll("#nav > ul > li"); // nav link
const firstList = document.querySelector("#nav > ul > li:first-child"); // nav 첫 번째 link
const line = document.querySelector(".line"); // menu하단에 존재하는 line
const contents__list = document.querySelector("#contents__list"); // 컨텐츠 목록
const width = document.querySelector(".content-container").clientWidth; // wrapper 너비

links.forEach(menu =>
  menu.addEventListener("click", (e)=>horizontal(e))
  );

function horizontal(e){
  line.style.left = e.currentTarget.offsetLeft+"px";
  line.style.width = e.currentTarget.offsetWidth+"px";
  line.style.top = 
  e.currentTarget.offsetTop + e.currentTarget.offsetHeight+"px";

}