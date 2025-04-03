<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="org.generationitaly.casanova.persistence.entity.Listing" %>
    <%@ page import="org.generationitaly.casanova.persistence.entity.Immobile" %>
      <%@ page import="org.generationitaly.casanova.persistence.entity.Comune" %>
        <%@ page import="org.generationitaly.casanova.persistence.entity.Provincia" %>
          <%@ page import="org.generationitaly.casanova.persistence.entity.TipologiaImmobile" %>
            <%@ page import="org.generationitaly.casanova.persistence.entity.User" %>

              <!DOCTYPE html>
              <% Listing lst=(Listing) request.getAttribute("listing"); %>
                <html>

                <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <title>CasaNova - <%=lst.getTitle()%></title>
                  <%@ include file="css.jsp" %>
                  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
                      padding-top: 76px;
                    }

                    .property-header {
                      background: white;
                      padding: 2rem;
                      border-radius: 1rem;
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                      margin-bottom: 2rem;
                    }

                    .property-title {
                      font-size: 2.5rem;
                      font-weight: 700;
                      color: var(--text-color);
                      margin-bottom: 1rem;
                    }

                    .property-location {
                      font-size: 1.1rem;
                      color: #4b5563;
                      display: flex;
                      align-items: center;
                      gap: 0.5rem;
                    }

                    .property-price {
                      font-size: 2.5rem;
                      font-weight: 700;
                      color: var(--primary-color);
                      margin-bottom: 0.5rem;
                    }

                    .property-type {
                      font-size: 1rem;
                      padding: 0.5rem 1rem;
                      border-radius: 2rem;
                      background: var(--accent-color);
                      color: white;
                    }

                    .property-carousel {
                      border-radius: 1rem;
                      overflow: hidden;
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                      margin-bottom: 2rem;
                    }

                    .property-carousel .carousel-item img {
                      height: 500px;
                      object-fit: cover;
                    }

                    .property-carousel .carousel-control-prev,
                    .property-carousel .carousel-control-next {
                      width: 5%;
                      background: rgba(0,0,0,0.3);
                      border-radius: 50%;
                      height: 50px;
                      width: 50px;
                      top: 50%;
                      transform: translateY(-50%);
                    }

                    .property-features {
                      background: white;
                      padding: 2rem;
                      border-radius: 1rem;
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                      margin-bottom: 2rem;
                    }

                    .feature-item {
                      display: flex;
                      align-items: center;
                      gap: 1rem;
                      padding: 1rem;
                      background: var(--light-bg);
                      border-radius: 1rem;
                      transition: all 0.3s ease;
                    }

                    .feature-item:hover {
                      transform: translateY(-2px);
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                    }

                    .feature-item i {
                      font-size: 1.5rem;
                      color: var(--primary-color);
                    }

                    .feature-label {
                      color: #6b7280;
                      font-size: 0.9rem;
                    }

                    .feature-value {
                      color: var(--text-color);
                      font-size: 1.1rem;
                    }

                    .property-description {
                      background: white;
                      padding: 2rem;
                      border-radius: 1rem;
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                      margin-bottom: 2rem;
                    }

                    .section-title {
                      font-size: 1.5rem;
                      font-weight: 600;
                      color: var(--text-color);
                      margin-bottom: 1.5rem;
                      padding-bottom: 0.5rem;
                      border-bottom: 2px solid var(--border-color);
                    }

                    .property-description p {
                      font-size: 1.1rem;
                      line-height: 1.8;
                      color: #4b5563;
                    }

                    .property-contact {
                      background: white;
                      padding: 2rem;
                      border-radius: 1rem;
                      box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
                    }

                    .contact-info {
                      display: flex;
                      flex-direction: column;
                      gap: 1rem;
                    }

                    .contact-item {
                      display: flex;
                      align-items: center;
                      gap: 1rem;
                      font-size: 1.1rem;
                      color: #4b5563;
                    }

                    .contact-item i {
                      font-size: 1.2rem;
                      color: var(--primary-color);
                    }

                    .btn-favorite {
                      padding: 1rem 2rem;
                      border-radius: 1rem;
                      font-weight: 500;
                      display: flex;
                      align-items: center;
                      gap: 0.5rem;
                      transition: all 0.3s ease;
                    }

                    .btn-favorite:hover {
                      transform: translateY(-2px);
                    }

                    @media (max-width: 768px) {
                      .property-title {
                        font-size: 2rem;
                      }

                      .property-price {
                        font-size: 2rem;
                      }

                      .property-carousel .carousel-item img {
                        height: 300px;
                      }

                      .feature-item {
                        padding: 0.8rem;
                      }

                      .property-description p {
                        font-size: 1rem;
                      }
                    }
                  </style>
                </head>

                <body>
                  <%@ include file="navbar.jsp" %>


                    <div class="container my-5">
                      <div class="property-header">
                        <div class="row align-items-center">
                          <div class="col-md-8">
                            <h1 class="property-title"><%=lst.getTitle()%></h1>
                            <div class="property-location">
                              <i class="bi bi-geo-alt-fill text-danger"></i>
                              <span><%=lst.getBuilding().getIndirizzo()%>, <%=lst.getBuilding().getComune().getNomeComune()%>, <%=lst.getBuilding().getProvincia().getNomeProvincia()%></span>
                            </div>
                          </div>
                          <div class="col-md-4 text-md-end">
                            <div class="property-price">€<%=lst.getPrezzo()%></div>
                            <span class="property-type"><%=lst.getBuilding().getTipologiaImmobile().getTipologia()%></span>
                          </div>
                        </div>
                      </div>

                      <div class="property-carousel">
                        <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img src="<%=lst.getImmagineImmobile() != null ?lst.getImmagineImmobile().getImg():""%>" class="d-block w-100" alt="Featured image 1">
                            </div>
                      <!--  <div class="carousel-item">
                              <img src="https://pwm.im-cdn.it/image/1657921143/xxl.jpg/" class="d-block w-100" alt="Featured image 2">
                            </div>
                            <div class="carousel-item">
                              <img src="https://pwm.im-cdn.it/image/1657921151/xxl.jpg" class="d-block w-100" alt="Featured image 3">
                            </div> -->      
                          </div>
                    <!--  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          </button>
                          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                          </button>-->      
                        </div>
                      </div>

                      <div class="property-features">
                        <div class="row g-3">
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-house-door"></i>
                              <div>
                                <div class="feature-label">Locali</div>
                                <div class="feature-value"><%=lst.getBuilding().getLocali()%></div>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-rulers"></i>
                              <div>
                                <div class="feature-label">Superficie</div>
                                <div class="feature-value"><%=lst.getBuilding().getSuperficie()%> m²</div>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-water"></i>
                              <div>
                                <div class="feature-label">Bagni</div>
                                <div class="feature-value"><%=lst.getBuilding().getBagno()%></div>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-layers"></i>
                              <div>
                                <div class="feature-label">Piano</div>
                                <div class="feature-value"><%=lst.getBuilding().getPiano()%></div>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-arrow-up-square"></i>
                              <div>
                                <div class="feature-label">Ascensore</div>
                                <div class="feature-value"><%=lst.getBuilding().isAscensore() ? "Sì" : "No"%></div>
                              </div>
                            </div>
                          </div>
                          <div class="col-6 col-md-4">
                            <div class="feature-item">
                              <i class="bi bi-tree"></i>
                              <div>
                                <div class="feature-label">Terrazzo</div>
                                <div class="feature-value"><%=lst.getBuilding().getTerrazzo()%></div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      <div class="property-description">
                        <h3 class="section-title">Descrizione</h3>
                        <p><%=lst.getDescrizione()%></p>
                      </div>

                      <div class="property-contact">
                        <div class="row align-items-center">
                          <div class="col-md-8">
                            <h4 class="section-title">Informazioni di contatto</h4>
                            <div class="contact-info">
                              <div class="contact-item">
                                <i class="bi bi-person"></i>
                                <span><%=lst.getUser().getUsername()%></span>
                              </div>
                              <div class="contact-item">
                                <i class="bi bi-telephone"></i>
                                <span><%=lst.getUser().getPhone()%></span>
                              </div>
                              <div class="contact-item">
                                <i class="bi bi-envelope"></i>
                                <span><%=lst.getUser().getEmail()%></span>
                              </div>
                            </div>
                          </div>
                          <div class="col-md-4 text-md-end mt-3 mt-md-0">
                            <form action="like" method="post" style="display: inline;">
                              <input type="hidden" name="listingId" value="<%=lst.getListing_id()%>">
                              <button type="submit" class="btn btn-primary btn-favorite">
                                <i class="bi bi-heart"></i>
                                <span>Aggiungi ai preferiti</span>
                              </button>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>


                    <br>
                    <br>
                    <br>
                    <br>
                    <%@ include file="js.jsp" %>
                      <%@ include file="footer.jsp" %>
                </body>

                </html>