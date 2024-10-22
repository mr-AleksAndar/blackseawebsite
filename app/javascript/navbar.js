function initNavbar() {
    console.log("Navbar initialized");

    const toggleButton = document.getElementById("navbar-toggle");
    const mobileMenu = document.getElementById("mobile-menu");

    if (toggleButton) {
        console.log("Toggle button found");
        toggleButton.removeEventListener("click", toggleMenu);
        toggleButton.addEventListener("click", toggleMenu);
    }

    // Reinitialize Flowbite dropdowns after Turbo loads
    if (typeof window.initFlowbite === 'function') {
        console.log("Reinitializing Flowbite dropdowns");
        window.initFlowbite();
    } else {
        console.log("Flowbite initialization function not found");
    }
}

function toggleMenu() {
    console.log("Menu toggle clicked");

    const mobileMenu = document.getElementById("mobile-menu");
    if (mobileMenu) {
        mobileMenu.style.display = mobileMenu.style.display === "none" || mobileMenu.style.display === "" ? "block" : "none";
    }
}

// Event listeners for both page loads and Turbo page transitions
document.addEventListener("DOMContentLoaded", initNavbar);
document.addEventListener("turbo:load", initNavbar);