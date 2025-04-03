<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CasaNova - Registrati</title>
    <%@ include file="css.jsp" %>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">
    <%@ include file="navbar.jsp" %>

    <div class="container d-flex justify-content-center align-items-center flex-grow-1 py-5">
        <div class="card shadow-lg border-0 rounded-4" style="max-width: 400px; width: 100%;">
            <div class="card-body p-4 p-md-5">
                <div class="text-center mb-4">
                    <i class="bi bi-person-plus-fill text-primary display-4 mb-3"></i>
                    <h2 class="h3 mb-2">Crea il tuo account</h2>
                    <p class="text-muted">Inserisci i tuoi dati per registrarti</p>
                </div>
                
                <% String errore = request.getParameter("errore"); %>
                <% if (errore != null) { %>
                    <div class="alert alert-danger d-flex align-items-center" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <div>Errore durante la registrazione. Riprova.</div>
                    </div>
                <% } %>
                
                <form method="post" action="signup" class="needs-validation" novalidate>
                    <div class="form-floating mb-3">
                        <input name="email" type="email" class="form-control" id="input-email" placeholder="Email" required>
                        <label for="input-email">Email</label>
                        <div class="invalid-feedback">
                            Inserisci un indirizzo email valido
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="username" type="text" class="form-control" id="input-username" placeholder="Username" required>
                        <label for="input-username">Username</label>
                        <div class="invalid-feedback">
                            Inserisci un username
                        </div>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="pwd" type="password" class="form-control" id="input-password" placeholder="Password" required>
                        <label for="input-password">Password</label>
                        <div class="invalid-feedback">
                            Inserisci una password
                        </div>
                    </div>
                    <div class="form-floating mb-4">
                        <input name="password_confirmation" type="password" class="form-control" id="input-password-confirm" placeholder="Conferma Password" required>
                        <label for="input-password-confirm">Conferma Password</label>
                        <div class="invalid-feedback">
                            Le password non coincidono
                        </div>
                    </div>
                <div class="mb-3">
                    <label for="input-nome" class="form-label">Nome</label>
                    <input name="first_name" type="text" class="form-control" id="input-nome" required>
                </div>
                <div class="mb-3">
                    <label for="input-cognome" class="form-label">Cognome</label>
                    <input name="last_name" type="text" class="form-control" id="input-cognome" required>
                </div>
                <div class="mb-3">
                    <label for="input-cellulare" class="form-label">Cellulare</label>
                    <input name="phone" type="text" class="form-control" id="input-username" required>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Il tuo ruolo</label>
                    <input value="STANDARD" name="role" type="text" class="form-control" id="role" readonly>
                </div>
                <button type="submit" class="btn btn-primary w-100 py-3 mb-3">
                        <i class="bi bi-person-plus me-2"></i>Registrati
                    </button>
                </form>
                <div class="text-center">
                    <p class="mb-0">Hai già un account? 
                        <a href="login.jsp" class="text-primary text-decoration-none fw-medium">
                            Accedi qui
                            <i class="bi bi-arrow-right ms-1"></i>
                        </a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
    <%@ include file="js.jsp" %>

    <style>
    .card {
        transition: transform 0.3s ease;
    }
    .card:hover {
        transform: translateY(-5px);
    }
    .form-floating > .form-control:focus ~ label,
    .form-floating > .form-control:not(:placeholder-shown) ~ label {
        color: #0d6efd;
    }
    .btn-primary {
        transition: all 0.2s ease;
    }
    .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 4px 8px rgba(13, 110, 253, 0.2);
    }
    </style>

    <script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()

    // Password confirmation validation
    document.getElementById('input-password-confirm').addEventListener('input', function() {
        var password = document.getElementById('input-password').value;
        var confirmPassword = this.value;
        if (password !== confirmPassword) {
            this.setCustomValidity('Le password non coincidono');
        } else {
            this.setCustomValidity('');
        }
    });
    </script>
</body>
</html>