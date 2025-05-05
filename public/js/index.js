document.querySelectorAll("img").forEach((img) => {
    img.onerror = () => {
        document.getElementById("gametop").src = "./img/hellgames.png";
    }
})