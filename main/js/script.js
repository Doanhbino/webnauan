function filterRecipes(category) {
  const xhr = new XMLHttpRequest();
  xhr.open("GET", "fetch_recipes.php?phucvu=" + category, true);
  xhr.onload = function () {
    if (this.status == 200) {
      document.getElementById("recipeList").innerHTML = this.responseText;
    } else {
      document.getElementById("recipeList").innerHTML =
        "<p>Không có công thức nào để hiển thị.</p>";
    }
  };
  xhr.send();
}
