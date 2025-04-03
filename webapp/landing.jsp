<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CasaNova - Trova la Casa dei Tuoi Sogni</title>
    <%@ include file="css.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        :root {
            --primary-color: #0087CE;
            --secondary-color: #6c757d;
            --accent-color: #f59e0b;
            --text-color: #1f2937;
            --light-bg: #f3f4f6;
            --border-color: #e5e7eb;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-color);
            line-height: 1.6;
        }

        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                        url('https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            align-items: center;
            position: relative;
            margin-top: -76px;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
            color: white;
            padding: 0 2rem;
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .featured-properties {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
        }

        .property-card {
            background: var(--light-bg);
            border-radius: 0.5rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .property-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
        }

        .property-image {
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .property-info {
            padding: 1.5rem;
        }

        .property-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }

        .property-location {
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        .property-features {
            display: flex;
            gap: 1rem;
            color: var(--secondary-color);
            font-size: 0.9rem;
        }

        .features {
            padding: 6rem 0;
            background: var(--light-bg);
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
        }

        .feature-icon {
            width: 64px;
            height: 64px;
            background: rgba(0, 135, 206, 0.1);
            border-radius: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .feature-icon i {
            font-size: 2rem;
            color: var(--primary-color);
        }

        .testimonials {
            padding: 6rem 0;
            background: var(--light-bg);
        }

        .testimonial-card {
            background: white;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
            margin: 1rem;
        }

        .testimonial-avatar {
            width: 64px;
            height: 64px;
            border-radius: 50%;
            margin-bottom: 1rem;
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 1.5rem;
            color: var(--secondary-color);
        }

        .cta {
            padding: 6rem 0;
            background: linear-gradient(135deg, var(--primary-color), #0056b3);
            color: white;
            text-align: center;
        }

        .cta h2 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
        }

        .cta p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }

            .featured-properties {
                padding: 1.5rem;
            }

            .property-card {
                margin-bottom: 1.5rem;
            }

            .feature-card {
                margin-bottom: 2rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <section class="hero">
        <div class="hero-content">
            <h1>Trova la Casa dei Tuoi Sogni</h1>
            <p>Esplora migliaia di annunci immobiliari in tutta Italia. CasaNova ti aiuta a trovare la casa perfetta per te e la tua famiglia.</p>
            <div class="featured-properties">
                <h3 class="text-center mb-4">Immobili in Evidenza</h3>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="property-card">
                            <div class="property-image" style="background-image: url('https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80')"></div>
                            <div class="property-info">
                                <div class="property-price">€450.000</div>
                                <div class="property-location">
                                    <i class="bi bi-geo-alt me-1"></i>Milano, MI
                                </div>
                                <div class="property-features">
                                    <span><i class="bi bi-house-door me-1"></i>120m²</span>
                                    <span><i class="bi bi-bed me-1"></i>3</span>
                                    <span><i class="bi bi-bath me-1"></i>2</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="property-card">
                            <div class="property-image" style="background-image: url('https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80')"></div>
                            <div class="property-info">
                                <div class="property-price">€380.000</div>
                                <div class="property-location">
                                    <i class="bi bi-geo-alt me-1"></i>Roma, RM
                                </div>
                                <div class="property-features">
                                    <span><i class="bi bi-house-door me-1"></i>95m²</span>
                                    <span><i class="bi bi-bed me-1"></i>2</span>
                                    <span><i class="bi bi-bath me-1"></i>1</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="property-card">
                            <div class="property-image" style="background-image: url('https://images.unsplash.com/photo-1568605114967-8130f3a36994?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')"></div>
                            <div class="property-info">
                                <div class="property-price">€520.000</div>
                                <div class="property-location">
                                    <i class="bi bi-geo-alt me-1"></i>Firenze, FI
                                </div>
                                <div class="property-features">
                                    <span><i class="bi bi-house-door me-1"></i>150m²</span>
                                    <span><i class="bi bi-bed me-1"></i>4</span>
                                    <span><i class="bi bi-bath me-1"></i>2</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="features">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-4 fw-bold">Perché Scegliere CasaNova?</h2>
                <p class="lead text-muted">Scopri i vantaggi di utilizzare la nostra piattaforma</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-house-heart"></i>
                        </div>
                        <h3>Annunci Verificati</h3>
                        <p>Tutti gli annunci sono controllati e verificati dal nostro team di esperti per garantirti la massima sicurezza.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-geo-alt"></i>
                        </div>
                        <h3>Ricerca Avanzata</h3>
                        <p>Trova facilmente la casa perfetta grazie ai nostri filtri avanzati e alla ricerca per zona.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-shield-check"></i>
                        </div>
                        <h3>Supporto Dedicato</h3>
                        <p>Il nostro team di assistenza è sempre pronto ad aiutarti in ogni fase della ricerca.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-4 fw-bold">Cosa Dicono i Nostri Clienti</h2>
                <p class="lead text-muted">Le esperienze di chi ha trovato casa con noi</p>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <img src="https://i.pravatar.cc/150?img=1" alt="Avatar" class="testimonial-avatar">
                        <p class="testimonial-text">"CasaNova mi ha aiutato a trovare la casa perfetta in tempi record. Il supporto è stato eccezionale!"</p>
                        <h5>Marco Rossi</h5>
                        <p class="text-muted">Milano</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <img src="https://i.pravatar.cc/150?img=2" alt="Avatar" class="testimonial-avatar">
                        <p class="testimonial-text">"La piattaforma è molto intuitiva e gli annunci sono sempre aggiornati. Consigliatissima!"</p>
                        <h5>Laura Bianchi</h5>
                        <p class="text-muted">Roma</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="testimonial-card">
                        <img src="https://i.pravatar.cc/150?img=3" alt="Avatar" class="testimonial-avatar">
                        <p class="testimonial-text">"Ho apprezzato molto la professionalità degli agenti e la qualità degli annunci."</p>
                        <h5>Giuseppe Verdi</h5>
                        <p class="text-muted">Napoli</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="cta">
        <div class="container">
            <h2>Pronto a Trovare la Tua Casa?</h2>
            <p>Unisciti a migliaia di persone che hanno già trovato la casa dei loro sogni con CasaNova.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="register.jsp" class="btn btn-light btn-lg px-4">
                    <i class="bi bi-person-plus me-2"></i>Registrati
                </a>
                <a href="searchEntity" class="btn btn-outline-light btn-lg px-4">
                    <i class="bi bi-search me-2"></i>Cerca Casa
                </a>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html> 