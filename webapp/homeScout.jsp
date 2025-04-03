
<!-- da eliminare -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Immobili Premium | Catalogo Completo</title>
		<%@ include file="css.jsp" %>
		<link rel="stylesheet" href="css/style.css">
		<style>
			:root {
				--primary-color: #2563eb;
				--secondary-color: #1e40af;
				--accent-color: #f59e0b;
				--text-color: #1f2937;
				--light-bg: #f3f4f6;
				--border-color: #e5e7eb;
			}

			body {
				background: var(--light-bg);
				color: var(--text-color);
			}

			.search-hero {
				background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80');
				background-size: cover;
				background-position: center;
				height: 300px;
				display: flex;
				align-items: center;
				color: white;
				margin-bottom: 3rem;
			}

			.search-hero-content {
				text-align: center;
			}

			.search-hero h1 {
				font-size: 2.5rem;
				font-weight: 700;
				margin-bottom: 1rem;
			}

			.search-hero p {
				font-size: 1.1rem;
				opacity: 0.9;
			}

			.filter-section {
				background: white;
				padding: 2rem;
				border-radius: 1rem;
				box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -1px rgba(0,0,0,0.06);
				margin-bottom: 2rem;
				position: relative;
				z-index: 10;
				margin-top: -100px;
			}

			.filter-btn {
				background: white;
				border: 2px solid var(--border-color);
				padding: 1rem 2rem;
				border-radius: 1rem;
				transition: all 0.3s ease;
				font-weight: 500;
				display: flex;
				align-items: center;
				gap: 0.5rem;
				font-size: 1.1rem;
			}

			.filter-btn:hover {
				background: var(--primary-color);
				border-color: var(--primary-color);
				color: white;
				transform: translateY(-2px);
			}

			.filter-btn i {
				font-size: 1.2rem;
			}

			.view-toggle .btn {
				padding: 1rem 1.5rem;
				border-radius: 1rem;
				transition: all 0.3s ease;
				font-size: 1.1rem;
				border: 2px solid var(--border-color);
			}

			.view-toggle .btn.active {
				background: var(--primary-color);
				color: white;
				border-color: var(--primary-color);
			}

			.view-toggle .btn:hover {
				transform: translateY(-2px);
			}

			.property-card {
				transition: all 0.3s ease;
				border: none;
				border-radius: 1.5rem;
				overflow: hidden;
				margin-bottom: 2rem;
				background: white;
				box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
			}

			.property-card:hover {
				transform: translateY(-5px);
				box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1), 0 10px 10px -5px rgba(0,0,0,0.04);
			}

			.property-card .card-header {
				background: white;
				border-bottom: 1px solid var(--border-color);
				padding: 1.5rem;
				display: flex;
				align-items: center;
				gap: 1rem;
			}

			.property-card .badge {
				padding: 0.8rem 1.5rem;
				font-weight: 500;
				border-radius: 1rem;
				font-size: 0.9rem;
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .carousel {
				border-radius: 1rem;
				overflow: hidden;
				position: relative;
			}

			.property-card .carousel-item img {
				height: 400px;
				object-fit: cover;
				transition: all 0.5s ease;
			}

			.property-card .carousel-item:hover img {
				transform: scale(1.1);
			}

			.property-card .card-body {
				padding: 2rem;
			}

			.property-card .card-title {
				font-size: 1.8rem;
				font-weight: 700;
				margin-bottom: 1rem;
				color: var(--text-color);
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .location {
				color: #4b5563;
				font-size: 1.1rem;
				margin-bottom: 1.5rem;
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .card-text {
				font-size: 1.1rem;
				line-height: 1.6;
				color: #4b5563;
				margin-bottom: 2rem;
			}

			.property-card .features {
				display: grid;
				grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
				gap: 1.5rem;
				margin: 2rem 0;
				padding: 1.5rem;
				background: var(--light-bg);
				border-radius: 1rem;
			}

			.property-card .feature-item {
				display: flex;
				align-items: center;
				gap: 0.8rem;
				color: var(--text-color);
				font-size: 1rem;
				font-weight: 500;
			}

			.property-card .feature-item i {
				font-size: 1.2rem;
				color: var(--primary-color);
			}

			.property-card .price {
				font-size: 2rem;
				font-weight: 700;
				color: var(--primary-color);
				margin-bottom: 0.5rem;
			}

			.property-card .price-per-sqm {
				font-size: 1rem;
				color: #6b7280;
			}

			.property-card .action-buttons {
				display: flex;
				gap: 1rem;
			}

			.property-card .btn {
				padding: 1rem 2rem;
				border-radius: 1rem;
				font-weight: 500;
				transition: all 0.3s ease;
				font-size: 1rem;
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .btn-primary {
				background: var(--primary-color);
				border: none;
			}

			.property-card .btn-primary:hover {
				background: var(--secondary-color);
				transform: translateY(-2px);
			}

			.property-card .btn-outline-primary {
				border: 2px solid var(--primary-color);
			}

			.property-card .btn-outline-primary:hover {
				background: var(--primary-color);
				color: white;
				transform: translateY(-2px);
			}

			.property-card .meta-info {
				display: flex;
				justify-content: space-between;
				align-items: center;
				margin-top: 2rem;
				padding-top: 1.5rem;
				border-top: 1px solid var(--border-color);
			}

			.property-card .date {
				color: #6b7280;
				font-size: 1rem;
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .favorite-btn {
				padding: 0.8rem 1.5rem;
				border-radius: 2rem;
				font-size: 1rem;
				transition: all 0.3s ease;
				display: flex;
				align-items: center;
				gap: 0.5rem;
			}

			.property-card .favorite-btn:hover {
				background: #dc2626;
				color: white;
				transform: translateY(-2px);
			}

			.pagination {
				margin-top: 4rem;
			}

			.pagination .page-link {
				padding: 1rem 1.5rem;
				margin: 0 0.3rem;
				border-radius: 1rem;
				border: none;
				color: var(--primary-color);
				transition: all 0.3s ease;
				font-weight: 500;
				font-size: 1.1rem;
			}

			.pagination .page-item.active .page-link {
				background: var(--primary-color);
				color: white;
			}

			.pagination .page-link:hover {
				background: var(--light-bg);
				color: var(--primary-color);
				transform: translateY(-2px);
			}

			@media (max-width: 768px) {
				.search-hero {
					height: 200px;
				}

				.search-hero h1 {
					font-size: 2rem;
				}

				.filter-section {
					padding: 1.5rem;
					margin-top: -50px;
				}

				.filter-btn {
					padding: 0.8rem 1.5rem;
					font-size: 0.9rem;
				}

				.property-card .carousel-item img {
					height: 250px;
				}

				.property-card .card-body {
					padding: 1.5rem;
				}

				.property-card .card-title {
					font-size: 1.5rem;
				}

				.property-card .features {
					grid-template-columns: repeat(2, 1fr);
					gap: 1rem;
					padding: 1rem;
				}

				.property-card .action-buttons {
					flex-direction: column;
				}

				.property-card .btn {
					width: 100%;
					justify-content: center;
				}

				.property-card .meta-info {
					flex-direction: column;
					gap: 1rem;
					text-align: center;
				}
			}
		</style>
	</head>
	<body>
		<%@ include file="navbar.jsp" %>
		
		<div class="search-hero">
			<div class="container">
				<div class="search-hero-content">
					<h1>Trova la casa dei tuoi sogni</h1>
					<p>Esplora la nostra selezione di immobili premium</p>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="filter-section">
				<div class="row align-items-center">
					<div class="col-md-6">
						<div class="d-flex gap-3">
							<button class="filter-btn">
								<i class="bi bi-funnel-fill"></i>
								<span>Filtri</span>
							</button>
							<button class="filter-btn">
								<i class="bi bi-geo-alt"></i>
								<span>Zona</span>
							</button>
							<button class="filter-btn">
								<i class="bi bi-currency-euro"></i>
								<span>Prezzo</span>
							</button>
						</div>
					</div>
					<div class="col-md-6 text-md-end">
						<div class="view-toggle btn-group">
							<button type="button" class="btn btn-outline-secondary">
								<i class="bi bi-grid"></i>
							</button>
							<button type="button" class="btn btn-outline-secondary active">
								<i class="bi bi-list-ul"></i>
							</button>
							<button type="button" class="btn btn-outline-secondary">
								<i class="bi bi-map"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-between align-items-center mb-4">
				<h2 class="mb-0">I nostri immobili</h2>
				<span class="badge bg-primary px-3 py-2 fs-5">12 risultati</span>
			</div>
			
			<!-- Property Card -->
			<div class="property-card">
				<div class="card-header">
					<span class="badge bg-success">
						<i class="bi bi-star-fill"></i>
						<span>Nuovo</span>
					</span>
					<span class="badge bg-info">
						<i class="bi bi-award"></i>
						<span>Esclusiva</span>
					</span>
				</div>
				<div class="row g-0">
					<div class="col-md-5">
						<div class="carousel">
							<div id="carousel1" class="carousel slide" data-bs-ride="carousel">
								<div class="carousel-indicators">
									<button type="button" data-bs-target="#carousel1" data-bs-slide-to="0" class="active"></button>
									<button type="button" data-bs-target="#carousel1" data-bs-slide-to="1"></button>
									<button type="button" data-bs-target="#carousel1" data-bs-slide-to="2"></button>
									<button type="button" data-bs-target="#carousel1" data-bs-slide-to="3"></button>
								</div>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img src="https://pwm.im-cdn.it/image/1544703467/xxl.jpg" class="d-block w-100" alt="Immobile">
									</div>
									<div class="carousel-item">
										<img src="https://pwm.im-cdn.it/image/1544703465/xxl.jpg" class="d-block w-100" alt="Immobile">
									</div>
									<div class="carousel-item">
										<img src="https://pwm.im-cdn.it/image/1544703477/xxl.jpg" class="d-block w-100" alt="Immobile">
									</div>
									<div class="carousel-item">
										<img src="https://pwm.im-cdn.it/image/1546359031/xxl.jpg" class="d-block w-100" alt="Immobile">
									</div>
								</div>
								<button class="carousel-control-prev" type="button" data-bs-target="#carousel1" data-bs-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								</button>
								<button class="carousel-control-next" type="button" data-bs-target="#carousel1" data-bs-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
								</button>
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="card-body">
							<h5 class="card-title">
								Appartamento in centro
								<i class="bi bi-patch-check-fill text-primary" data-bs-toggle="tooltip" title="Verificato"></i>
							</h5>
							<p class="location">
								<i class="bi bi-geo-alt-fill text-danger"></i>
								Via Roma 123, Milano
							</p>
							<p class="card-text">
								Splendido appartamento con vista panoramica, dotato di ampi spazi luminosi, cucina moderna, 
								due bagni e una grande terrazza. Perfetto per chi cerca comfort e qualità della vita.
							</p>
							
							<div class="features">
								<div class="feature-item">
									<i class="bi bi-door-closed"></i>
									<span>3 camere</span>
								</div>
								<div class="feature-item">
									<i class="bi bi-basket"></i>
									<span>2 bagni</span>
								</div>
								<div class="feature-item">
									<i class="bi bi-rulers"></i>
									<span>120 m²</span>
								</div>
								<div class="feature-item">
									<i class="bi bi-car-front"></i>
									<span>1 posto auto</span>
								</div>
							</div>
							
							<div class="d-flex justify-content-between align-items-center">
								<div>
									<p class="price">€250.000</p>
									<p class="price-per-sqm">€2.083/m²</p>
								</div>
								<div class="action-buttons">
									<a href="#" class="btn btn-primary">
										<i class="bi bi-info-circle"></i>
										<span>Dettagli</span>
									</a>
									<button type="button" class="btn btn-outline-primary" data-bs-toggle="tooltip" title="Contatta agente">
										<i class="bi bi-telephone"></i>
									</button>
								</div>
							</div>
							
							<div class="meta-info">
								<div class="date">
									<i class="bi bi-clock"></i>
									<span>Inserito 3 giorni fa</span>
								</div>
								<button type="button" class="favorite-btn btn btn-outline-danger">
									<i class="bi bi-heart"></i>
									<span>Aggiungi ai preferiti</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="js.jsp" %>
		<%@ include file="footer.jsp" %>
	</body>
</html>