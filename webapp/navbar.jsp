<%@ page import="org.generationitaly.casanova.persistence.entity.User"%>
<% User user1 = (User) session.getAttribute("user"); %>
<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-white shadow-sm" id="navbar">
    <div class="container">
      <a class="navbar-brand d-flex align-items-center" href="landing.jsp">
        <i class="bi bi-house-door-fill text-primary me-2"></i>
        <span class="text-primary fw-bold">Casa</span><span class="text-dark fw-bold">Nova</span>
      </a>
      
      <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link px-3" href="landing.jsp">
              <i class="bi bi-house-door me-1"></i>Home
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="profile">
              <i class="bi bi-person me-1"></i>Profilo
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="addimmobile">
              <i class="bi bi-plus-circle me-1"></i>Inserisci annuncio
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link px-3" href="lavora-con-noi.jsp">
              <i class="bi bi-briefcase me-1"></i>Lavora con noi
            </a>
          </li>
          <% if(user1 != null && (user1.getRole() != user1.getRole().STANDARD)){ %>
          <li class="nav-item">
            <a class="nav-link px-3" href="profile">
              <i class="bi bi-speedometer2 me-1"></i>Dashboard
            </a>
          </li>
          <% } %>
        </ul>
        
        <div class="ms-3">
          <% if(user1 != null) { %>
            <div class="dropdown">
              <button class="btn btn-outline-primary rounded-pill px-3 dropdown-toggle" type="button"
                id="userDropdown"
                data-bs-toggle="dropdown" 
                aria-expanded="false">
                <i class="bi bi-person-circle me-1"></i><%= user1.getUsername() %>
              </button>
              <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0" aria-labelledby="userDropdown">
                <li><a class="dropdown-item" href="profile">
                  <i class="bi bi-person me-2"></i>Il mio profilo
                </a></li>
                <li><a class="dropdown-item" href="addimmobile">
                  <i class="bi bi-plus-circle me-2"></i>Nuovo annuncio
                </a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item text-danger" href="logout">
                  <i class="bi bi-box-arrow-right me-2"></i>Logout
                </a></li>
              </ul>
            </div>
          <% } else { %>
            <div class="d-flex gap-2">
              <a href="login.jsp" class="btn btn-outline-primary rounded-pill px-3">
                <i class="bi bi-box-arrow-in-right me-1"></i>Accedi
              </a>
              <a href="register.jsp" class="btn btn-primary rounded-pill px-3">
                <i class="bi bi-person-plus me-1"></i>Registrati
              </a>
            </div>
          <% } %>
        </div>
      </div>
    </div>
</nav>

<style>
body {
  padding-top: 76px; /* Height of navbar + some extra space */
}

.navbar {
  height: 76px;
  padding: 0;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
  background-color: rgba(255, 255, 255, 0.95) !important;
  z-index: 9999;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
}

.navbar-brand {
  font-size: 1.5rem;
  letter-spacing: 0.5px;
  transition: all 0.2s ease;
}

.navbar-brand:hover {
  transform: translateY(-1px);
}

.nav-link {
  font-weight: 500;
  color: #333 !important;
  transition: all 0.2s ease;
  position: relative;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  height: 76px;
  display: flex;
  align-items: center;
}

.nav-link:hover {
  color: #0d6efd !important;
  background-color: rgba(13, 110, 253, 0.1);
}

.nav-link::after {
  content: '';
  position: absolute;
  width: 0;
  height: 2px;
  bottom: 0;
  left: 50%;
  background-color: #0d6efd;
  transition: all 0.2s ease;
  transform: translateX(-50%);
}

.nav-link:hover::after {
  width: 80%;
}

.dropdown {
  position: relative;
  z-index: 10000;
}

.dropdown-menu {
  padding: 0.5rem 0;
  border-radius: 0.5rem;
  margin-top: 0.5rem;
  border: none;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  display: none;
  position: absolute;
  right: 0;
  z-index: 10000;
  background-color: white;
  min-width: 200px;
  transform: none !important;
}

.dropdown-menu.show {
  display: block !important;
  opacity: 1 !important;
  visibility: visible !important;
}

.dropdown-item {
  padding: 0.5rem 1rem;
  font-weight: 500;
  transition: all 0.2s ease;
  border-radius: 0.25rem;
  margin: 0.25rem 0.5rem;
  width: calc(100% - 1rem);
  display: block;
  clear: both;
  white-space: nowrap;
  background-color: transparent;
  border: 0;
  cursor: pointer;
  color: #333;
}

.dropdown-item:hover {
  background-color: rgba(13, 110, 253, 0.1);
  color: #0d6efd;
}

.dropdown-item.text-danger:hover {
  background-color: #dc3545;
  color: white !important;
}

.btn-outline-primary, .btn-primary {
  transition: all 0.2s ease;
}

.btn-outline-primary:hover, .btn-primary:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 8px rgba(13, 110, 253, 0.2);
}

@media (max-width: 991.98px) {
  body {
    padding-top: 76px;
  }

  .navbar-collapse {
    background-color: white;
    padding: 1rem;
    border-radius: 0.5rem;
    margin-top: 1rem;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    z-index: 10000;
  }
  
  .nav-link {
    height: auto;
    padding: 0.75rem 1rem;
    margin: 0.25rem 0;
    border-radius: 0.5rem;
  }
  
  .nav-link::after {
    display: none;
  }

  .nav-link:hover {
    background-color: rgba(13, 110, 253, 0.1);
  }

  .ms-3 {
    margin-top: 1rem !important;
    display: flex;
    justify-content: center;
  }

  .dropdown-menu {
    position: static;
    margin-top: 0;
    box-shadow: none;
    background-color: transparent;
    min-width: auto;
    display: none;
  }

  .dropdown-menu.show {
    display: block !important;
  }
}
</style>

<script>
</script>