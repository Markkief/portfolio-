<footer class="footer mt-auto py-5">
    <div class="container">
        <div class="row g-4">
            <!-- Company Info -->
            <div class="col-lg-4 col-md-6">
                <div class="footer-brand mb-4">
                    <h5 class="text-primary fw-bold mb-3">Casa<span class="text-dark">Nova</span></h5>
                    <p class="text-muted mb-4">
                        Real estate solutions designed for comfort and innovation. Find your dream home with us!
                    </p>
                    <div class="social-links">
                        <a href="#" class="btn btn-outline-primary btn-sm me-2">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="btn btn-outline-primary btn-sm me-2">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a href="#" class="btn btn-outline-primary btn-sm me-2">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6">
                <h6 class="text-dark fw-bold mb-4">Quick Links</h6>
                <ul class="list-unstyled footer-links">
                    <li class="mb-2">
                        <a href="index.jsp" class="text-muted text-decoration-none">
                            <i class="bi bi-chevron-right me-1"></i>Home
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="profile" class="text-muted text-decoration-none">
                            <i class="bi bi-chevron-right me-1"></i>Profile
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="addimmobile" class="text-muted text-decoration-none">
                            <i class="bi bi-chevron-right me-1"></i>Submit Listing
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="lavora-con-noi.jsp" class="text-muted text-decoration-none">
                            <i class="bi bi-chevron-right me-1"></i>Careers
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="col-lg-3 col-md-6">
                <h6 class="text-dark fw-bold mb-4">Contact Us</h6>
                <ul class="list-unstyled footer-contact">
                    <li class="mb-3">
                        <a href="mailto:info@casanova.com" class="text-muted text-decoration-none">
                            <i class="bi bi-envelope me-2"></i>info@casanova.com
                        </a>
                    </li>
                    <li class="mb-3">
                        <a href="tel:+39123456789" class="text-muted text-decoration-none">
                            <i class="bi bi-phone me-2"></i>+39 123 456 789
                        </a>
                    </li>
                    <li class="mb-3">
                        <span class="text-muted">
                            <i class="bi bi-geo-alt me-2"></i>Milano, Lombardia, Italy
                        </span>
                    </li>
                </ul>
            </div>

            <!-- Newsletter -->
            <div class="col-lg-3 col-md-6">
                <h6 class="text-dark fw-bold mb-4">Newsletter</h6>
                <p class="text-muted mb-3">Subscribe to our newsletter for updates and exclusive offers.</p>
                <form class="footer-newsletter">
                    <div class="input-group">
                        <input type="email" class="form-control" placeholder="Your email">
                        <button class="btn btn-primary" type="submit">
                            <i class="bi bi-send"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Copyright -->
        <div class="footer-bottom mt-5 pt-4 border-top">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="text-muted mb-0">
                        &copy; 2025 CasaNova. All Rights Reserved.
                    </p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="#" class="text-muted text-decoration-none me-3">Privacy Policy</a>
                    <a href="#" class="text-muted text-decoration-none">Terms of Service</a>
                </div>
            </div>
        </div>
    </div>
</footer>

<style>
.footer {
    background-color: #f8f9fa;
    position: relative;
}

.footer-brand p {
    font-size: 0.95rem;
    line-height: 1.6;
}

.footer-links a {
    transition: all 0.2s ease;
}

.footer-links a:hover {
    color: #0d6efd !important;
    transform: translateX(5px);
}

.footer-contact a {
    transition: all 0.2s ease;
}

.footer-contact a:hover {
    color: #0d6efd !important;
}

.footer-newsletter .form-control {
    border-radius: 20px 0 0 20px;
    border: 1px solid #dee2e6;
}

.footer-newsletter .btn {
    border-radius: 0 20px 20px 0;
}

.social-links .btn {
    width: 35px;
    height: 35px;
    padding: 0;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
}

.social-links .btn:hover {
    background-color: #0d6efd;
    color: white;
    transform: translateY(-2px);
}

.footer-bottom {
    border-color: #dee2e6 !important;
}

@media (max-width: 768px) {
    .footer {
        text-align: center;
    }
    
    .footer-brand {
        text-align: center;
    }
    
    .social-links {
        justify-content: center;
    }
    
    .footer-newsletter {
        max-width: 400px;
        margin: 0 auto;
    }
}
</style>
  