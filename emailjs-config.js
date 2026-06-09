// EmailJS configuration for client-side notifications
// This file is excluded from git by .gitignore.
// Replace the service and template IDs with your EmailJS values.

const EMAILJS_SERVICE_ID = 'your_service_id';
const EMAILJS_TEMPLATE_ID = 'your_template_id';
const EMAILJS_USER_ID = 'your_emailjs_public_key';
const EMAILJS_RECEIVER_EMAIL = 'irisdcb0@gmail.com';

if (typeof window !== 'undefined' && window.emailjs) {
  window.emailjs.init(EMAILJS_USER_ID);
  window.emailConfig = {
    publicKey: EMAILJS_USER_ID,
    service: EMAILJS_SERVICE_ID,
    template: EMAILJS_TEMPLATE_ID,
    receiver: EMAILJS_RECEIVER_EMAIL,
  };
} else {
  console.warn('EmailJS SDK not found. Include CDN and configure emailjs-config.js');
}
