const addActiveStatusToTab = function() {
  let tab = document.querySelectorAll(".tab");

  tab.forEach((t) => {
    console.log("boo")
    t.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active");
    });
  });
}
export { addActiveStatusToTab };
