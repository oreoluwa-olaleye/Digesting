document.addEventListener('DOMContentLoaded', function() {
    const consentBanner = document.getElementById('cookieConsent');
    const acceptButton = document.getElementById('acceptCookies');

    if (!localStorage.getItem('cookieConsent')) {
        consentBanner.style.display = 'block';
    }

    acceptButton.addEventListener('click', function() {
        consentBanner.style.display = 'none';
        localStorage.setItem('cookieConsent', 'accepted');
    });
});
