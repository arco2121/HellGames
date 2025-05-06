document.querySelectorAll(".gp").forEach((img) => {
    img.onerror = () => {
        img.src = "./img/key.png";
    }
})

document.getElementById("logo").addEventListener("click", () => {
    window.location.href = "/";
})
document.getElementById("search").addEventListener("click", () => {
    window.location.href = "/s/";
})