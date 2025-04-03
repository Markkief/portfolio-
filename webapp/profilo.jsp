<%@ page import="org.generationitaly.casanova.persistence.entity.User"%> 
<%@ page import="org.generationitaly.casanova.persistence.dto.UserProfileDTO"%>
<%@ page import="org.generationitaly.casanova.persistence.entity.Listing"%> 
<%@ page import="org.generationitaly.casanova.persistence.entity.Favourite"%> 
<%@ page import="java.util.List"%>

<% 
User user = (User) session.getAttribute("user"); 
if(user == null) {
	response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profilo Utente - CasaNova</title>
    <%@ include file="css.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        :root {
            --primary-color: #0087CE;
            --secondary-color: #6c757d;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
            --light-bg: #f8f9fa;
            --border-color: #dee2e6;
        }

        body {
            background-color: var(--light-bg);
        }

        .profile-sidebar {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
        }

        .profile-nav-item {
            display: flex;
            align-items: center;
            padding: 0.75rem 1rem;
            color: var(--secondary-color);
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.2s;
            margin-bottom: 0.5rem;
        }

        .profile-nav-item:hover {
            background-color: rgba(0, 135, 206, 0.1);
            color: var(--primary-color);
        }

        .profile-nav-item.active {
            background-color: var(--primary-color);
            color: white;
        }

        .profile-nav-item i {
            margin-right: 0.75rem;
            font-size: 1.1rem;
        }

        .profile-section {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            padding: 2rem;
            margin-bottom: 2rem;
        }

        .profile-section-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--border-color);
        }

        .profile-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            padding: 0.75rem;
            border-radius: 8px;
            background-color: var(--light-bg);
        }

        .profile-info-item i {
            color: var(--primary-color);
            margin-right: 1rem;
            font-size: 1.2rem;
        }

        .profile-info-item span {
            font-weight: 500;
            margin-right: 0.5rem;
        }

        .favorite-card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .favorite-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .favorite-card .card-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 0;
        }

        .property-features {
            background-color: #f8f9fa;
            border-radius: 8px;
            padding: 1rem;
        }

        .feature-item {
            display: flex;
            align-items: center;
            color: #666;
            font-size: 0.9rem;
        }

        .feature-item i {
            font-size: 1.1rem;
        }

        .btn-outline-danger {
            border-color: #dc3545;
            color: #dc3545;
        }

        .btn-outline-danger:hover {
            background-color: #dc3545;
            color: white;
        }

        @media (max-width: 768px) {
            .favorite-card {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<%
UserProfileDTO userp = (UserProfileDTO) request.getSession().getAttribute("profile");
List<Favourite> favouritesList = userp.getFavouritesList();
%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-3">
            <div class="profile-sidebar">
                <div class="text-center mb-4">
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANkAAADoCAMAAABVRrFMAAAAflBMVEX///8BAQEAAAD7+/vu7u7l5eXr6+v39/evr69nZ2fExMReXl7o6Oji4uLy8vJQUFBISEh0dHR6enqgoKAPDw86OjpXV1fZ2dmIiIi4uLiMjIxra2ukpKR+fn4gICDMzMwoKCg/Pz8YGBiYmJgzMzOzs7NEREQtLS3IyMglJSVsSSdtAAAIs0lEQVR4nO2dibaiOBCGMaiAiCwiqyugXt//BQeEsChKsWiwp77Tp2e6b8T6IVWpVEKa4xAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAEQRAkRVgqdoKyFFibMhjLRahvTFJgbvTwb8barJ4sRT8g9QS++LPqlDC6a5jUcf9JFCqsjWwPL55eqiqrO4k8a1NbMXcaZRXinDlrc8HMjTpZmX/V/bXxG9oE58H+2gDy0MD5gbHgXDH7ruIqhe5BWfEJgnJwQ+n6oC7+w5m14Q0s1ZLB9/DnLFY17VYLJ6qII0Rdft3aFoglY+P/3azfDVmz9abaXPyanW3hpYqhut34CduoaJNGOgIox9zK2F6vrhM+s/JI6VPHUaYlfxVd8FhX1bb4oIUdEUvmSe3Gp7lU+uzonG1NjYtz+fb3fWEWH19/wLoelIT5XQZdwS8uEA5uXQ9Kwrr2JnGUT62wymyO9K+wzd53Z3DyqEg2sFBfz2qTS/sbzLZezHJhar+RltdyaaMY1/gjtcfqfS2LXuo4hmzEz5/YABfLn5o/wMV6QqMH2Qxxm/nM10YQReZUmDkd5Hork0pjPc+2qCHdw30Vm96qITp3D9zUjiE7j0gv6Q52yQ7wtO8M6fBZSCITlvHRo04GyxVd+Xg7hU0OJNDb5fU3sCtz2nFA2b0SZXWrbUPDBb0suyCyy26uDGms0AlmczYvZw13A9jYifyRgapONCtMPnB433RJLzzMSNIe6mUOpLFbLsE1RXSHrafx9M6CEnypUjhteBgremk24fGcfT3sxm5KyiaN47qXKWNTOdZaOUNUUdbgaNw0u2tafzPbk03LiA5rrlZ6Y+P8SyfAhh9gTVoljOuysmtj8yx9ZFITSR2HRMDmq3KZu2ms5mjvJZteNnaCjjngGtq5KE5B0viQWR7iZt8MX0Pf3pOQ+DcVkmUq2Z37fnTMXLzZYwps+b6iBpzwRK0C1IDsSYfUTrBtcO9Kk1Kyb21ZT2jO+Lm1kwUjRzvclX0yZ51m39A0qA9NNprdPvgVNzYjWuYFoJlZR+QuntwfrU023A2PTeq47zraCOBFjTOT4Mh3CY1TW9xd4PU7Ghy/O0ebpttUwPVT5XC2Nml9B7wkapNY1tdLBrN0exH0W+2bZUmOH+0MCZAMZ0yzUtd3JzJxVucbe/AD2Pmyb5ycy0724cOTQIhsRG0y0yGIp08bfQP1gZmuy3Kgx8pUB+41sS9HvspAme6DlYlWrMywEmUtivWxMklSh1sLgZEoAz8z3pB12XdUR9tpLcJBokzXvq1MSQMIzM/c2MviCCLpJ19q8R1C9h3f7Y00NoIS8UuxFRUeGZPpxIRBbKRVM0hPoUWutmOTzaYEPoHnIGFR2mmVQGc5yLeX0bK8EZIqFTXUdskYm7wxK4xCFiuUYouf2er2p8sWX1+vdsDzs6KESoxWX8FofrZNvzZobqnlj6zlxD/r8G3C6RDQOkhj2C9qwyRo1RnnjOogNOw3ZkuLojO2Kx26bII+x10JzHW8Qlm7DR5G+gXHrgZ2BlroLLlZu7t/A966wVlkbtCQhfBBrqy0rAJIBRVodx+cFWwtd1kEkCIbFgGJscfKzfKx+vi+1aFws3w9ag2JJel+UHLpaWUXRAIZpNxCGR2YHAJQdiBsRrMEGvffbybbFsrSZEJIlpqaN6BJbTbRDI0FWSwpKUsmWrwbxML2jVMuutTDZpMj3fj1NisWSzt3JpKc6CKX5jKxw3aPYwAIX0UKcl/ITWafgL2QtKebg9najjVgS9uclKRNIBvlEugmPFavyAi0DPDObS6VvTuwrZB0lIbt6PoEWR3g7SsIlT1yRAWVhOi2a9AmvI+QP7R3jp5vSwKXrlzmjyx/O+utDatrtg2E+LDFdDqjY/si2g2w31bQE1mmAa2I0r4ImK9/kHwz89t+Nv1zbfB8Ou8HjF9mleiu56Em9QcC6AbfIHeKgdx9OfD1erAY1N+FIxXG9N2RlF3mF22WWV4h5C9Efr9IUMNlsE0v/IkKY7Bhs4ZwKGWlV1hZv3yWYkBmoABmt1zYd5c5X7IZZqMSDffsRzLKfJjy2QCv0Q8N3crca9F1ao1PGK07ttlQ/ERxLNF4hOX5a4+B2i6OJRqNjyVbwGsqWCvXhedGpXO/yGiiIidQ96jUQtbJrGUHqxTOduWzak6sXqV7xA7y/LXY8uLSmabUnP7/yZWzk5i9/fjI+XkEEsSo1LVu3rvOZTv76nlXI0iCU0qnsKThQ1joD+eOEbLX3eXzpJOfnfXgoanEfNpCKa0f7bjZ4bxTa476u28vCqzd1j0oU0EQVsrB3RqW+XSu3G00MbGyNafugL8HdY88NBjR0Tv0lZ/MtBottQrrdbc49+sbeC8eUWKrvN2/fISPbYP1uHQVx108PwIriYgL+XX/LLcdkX/lGPXxYkfrilNRfel+6Q9UcSwj8wPhU1wI9EUlxNMDKGt4cWTlSJiu1fxw6L3miLVV4JUtelYUFOqvsifaI1ZFmSsJzad5r+azuN1s/gOSEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBkK/x4kWB34cDvJbzm5SVEdDrR79Crix5gHblcbI0C0R9L6Q/5fJWXkg4EnrE0WVHcwJvP3Zp5LS/BuZxTy5aRLSLdgq0SIvy00tzZaEwC7n1fBpyB84+cFH1H3McI0STLMmQ9Mg6ycQ3JF82iC5LT8pUSxE5VZ1vOXXqH/jrDyg7Tia3iWSat4iYxLwGxIyOxHxSpvF2rIy3t5w11X9B2atoT3+eK/sLRZE7OItfUUZi95I01bKIfJJl1ddOkaZJqn95emYON3O5kJudOVkw7MNq7MomZO06Z8d1b+F6KzrhbnFde1vPcx6VPTxc2ciOvx4vJDDjX6YZ7Cfm3gzM3cS8//dJGT3rM/ktvh/2dvQDGtDPaj71LQs/xP8jb/y3+A/HhW30mHYR+QAAAABJRU5ErkJggg==" 
                     class="img-fluid rounded-circle mb-3" 
                     style="width: 100px; height: 100px; object-fit: cover;">
                    <h4 class="mb-1"><%= user.getFirst_name() %> <%= user.getLast_name() %></h4>
                    <p class="text-muted mb-0"><%= user.getUsername() %></p>
                </div>
                <nav class="nav flex-column">
                    <a class="profile-nav-item active" href="#sezioneProfilo" onclick="showSection('informazioni')">
                        <i class="bi bi-person-circle"></i>Informazioni
                    </a>
                    <a class="profile-nav-item" href="#sezioneAnnunciSalvati" onclick="showSection('annunci')">
                        <i class="bi bi-heart"></i>Annunci Salvati
                    </a>
                </nav>
            </div>
        </div>
        
        <div class="col-md-9">
            <div id="sezioneProfilo" class="profile-section">
                <h2 class="profile-section-title">
                    <i class="bi bi-person-circle me-2"></i>Informazioni Personali
                </h2>
                <div class="profile-info-item">
                    <i class="bi bi-person"></i>
                    <span>Nome:</span>
                    <%= user.getFirst_name() %>
                </div>
                <div class="profile-info-item">
                    <i class="bi bi-envelope"></i>
                    <span>Email:</span>
                    <%= user.getEmail() %>
                </div>
                <div class="profile-info-item">
                    <i class="bi bi-telephone"></i>
                    <span>Telefono:</span>
                    <%= user.getPhone() %>
                </div>
            </div>

            <div id="sezioneAnnunciSalvati" class="profile-section" style="display: none;">
                <h2 class="profile-section-title">
                    <i class="bi bi-heart me-2"></i>Annunci Salvati
                </h2>
                <div class="row g-4">
                    <%for(Favourite listing : favouritesList) { %>
                        <div class="col-md-6 col-lg-4">
                            <div class="favorite-card card h-100 shadow-sm border-0">
                                <div class="card-header bg-white border-0 py-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="badge bg-primary">
                                            <i class="bi bi-house-door me-1"></i><%= listing.getListing().getBuilding().getTipologiaImmobile().getTipologia() %>
                                        </span>
                                        <span class="badge bg-success">
                                            <i class="bi bi-currency-euro me-1"></i><%= listing.getListing().getPrezzo() %>
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title mb-3">
                                        <i class="bi bi-geo-alt text-primary me-2"></i><%= listing.getListing().getBuilding().getComune().getNomeComune() %>
                                    </h5>
                                    <div class="property-features mb-3">
                                        <div class="row g-2">
                                            <div class="col-6">
                                                <div class="feature-item">
                                                    <i class="bi bi-arrows-angle-expand text-muted"></i>
                                                    <span class="ms-2"><%= listing.getListing().getBuilding().getSuperficie() %> m²</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="feature-item">
                                                    <i class="bi bi-door-open text-muted"></i>
                                                    <span class="ms-2"><%= listing.getListing().getBuilding().getLocali() %> locali</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="feature-item">
                                                    <i class="bi bi-water text-muted"></i>
                                                    <span class="ms-2"><%= listing.getListing().getBuilding().getBagno() %> bagni</span>
                                                </div>
                                            </div>
                                            <div class="col-6">
                                                <div class="feature-item">
                                                    <i class="bi bi-layers text-muted"></i>
                                                    <span class="ms-2">Piano <%= listing.getListing().getBuilding().getPiano() %></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <a href="get-listing?id=<%= listing.getListing().getListing_id() %>" class="btn btn-outline-primary btn-sm">
                                            <i class="bi bi-eye me-1"></i>Visualizza
                                        </a>
                                        <button class="btn btn-outline-danger btn-sm" onclick="removeFavorite(<%= listing.getId_preferiti() %>)">
                                            <i class="bi bi-heart-fill me-1"></i>Rimuovi
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="js.jsp" %>
<%@ include file="footer.jsp" %>

<script>
function showSection(sectionId) {
    document.querySelectorAll('.profile-section').forEach(section => section.style.display = 'none');
    document.getElementById(sectionId === 'informazioni' ? 'sezioneProfilo' : 'sezioneAnnunciSalvati').style.display = 'block';
    
    document.querySelectorAll('.profile-nav-item').forEach(item => item.classList.remove('active'));
    event.target.classList.add('active');
}

function removeFavorite(listingId) {
    if (confirm('Sei sicuro di voler rimuovere questo annuncio dai preferiti?')) {
        // Add your remove favorite logic here
        window.location.href = 'unlike?likeId=' + listingId;
    }
}
</script>
</body>
</html>
