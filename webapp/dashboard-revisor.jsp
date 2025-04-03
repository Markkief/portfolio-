<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.generationitaly.casanova.persistence.dto.RevisorProfileDTO"%>
<%@ page import="org.generationitaly.casanova.persistence.entity.Listing"%>
<%@ page import="java.util.List"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CasaNova - Dashboard Revisor</title>
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

    .hero-section {
        background: linear-gradient(135deg, var(--primary-color), #0056b3);
        padding: 4rem 0;
        margin-bottom: 3rem;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .hero-title {
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 1rem;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    }

    .hero-subtitle {
        font-size: 1.2rem;
        opacity: 0.9;
    }

    .section-title {
        font-size: 1.8rem;
        font-weight: 600;
        margin-bottom: 1.5rem;
        padding-bottom: 0.5rem;
        border-bottom: 2px solid var(--border-color);
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .table {
        margin-bottom: 0;
    }

    .table thead th {
        background-color: var(--primary-color);
        color: white;
        border: none;
        padding: 1rem;
        font-weight: 500;
    }

    .table tbody tr {
        transition: background-color 0.2s;
    }

    .table tbody tr:hover {
        background-color: rgba(0, 135, 206, 0.05);
    }

    .btn {
        padding: 0.5rem 1rem;
        border-radius: 5px;
        font-weight: 500;
        transition: all 0.2s;
    }

    .btn:hover {
        transform: translateY(-1px);
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .btn-info {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
        color: white;
    }

    .btn-info:hover {
        background-color: #0056b3;
        border-color: #0056b3;
        color: white;
    }

    .table-responsive {
        border-radius: 10px;
        overflow: hidden;
    }

    .section-card {
        margin-bottom: 3rem;
    }

    .badge {
        font-weight: 500;
        padding: 0.5em 0.75em;
    }

    .btn-group {
        display: flex;
        gap: 0.5rem;
        flex-wrap: nowrap;
    }

    .btn-group .btn {
        padding: 0.5rem 0.75rem;
        border-radius: 0.375rem;
        font-weight: 500;
        transition: all 0.2s ease-in-out;
        white-space: nowrap;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }

    .btn-group .btn i {
        font-size: 1rem;
        margin-right: 0.25rem;
    }

    @media (max-width: 768px) {
        .table-responsive {
            margin: 0 -1rem;
            overflow-x: auto;
        }
        
        .btn-group {
            flex-wrap: wrap;
            justify-content: center;
            gap: 0.25rem;
        }
        
        .btn-group .btn {
            padding: 0.375rem 0.625rem;
            font-size: 0.875rem;
        }
    }

    /* Modal Animation */
    .modal.fade .modal-dialog {
        transform: scale(0.8);
        transition: transform 0.3s ease-in-out;
    }

    .modal.show .modal-dialog {
        transform: scale(1);
    }

    .modal-backdrop.fade {
        opacity: 0;
        transition: opacity 0.3s ease-in-out;
    }

    .modal-backdrop.show {
        opacity: 0.5;
    }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<% 
RevisorProfileDTO rev = (RevisorProfileDTO) request.getSession().getAttribute("profile");
List<Listing> pending = rev.getPendingList();
String errore = request.getParameter("errore");
NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.ITALY);
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>

<div class="hero-section text-white">
    <div class="container">
        <h1 class="hero-title">Dashboard Revisor</h1>
        <p class="hero-subtitle">Gestisci gli annunci in attesa di revisione</p>
    </div>
</div>

<div class="container">
    <div class="section-card">
        <h2 class="section-title text-warning">
            <i class="bi bi-house-door me-2"></i>Annunci da Revisionare
        </h2>
        <div class="card">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Comune</th>
                            <th>Provincia</th>
                            <th>Tipo</th>
                            <th>Prezzo</th>
                            <th>Locali</th>
                            <th>Data</th>
                            <th class="text-center">Azioni</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (pending != null && !pending.isEmpty()) {
                            for (Listing x : pending) { %>
                            <tr>
                                <td>
                                    <span class="badge bg-secondary">#<%= x.getBuilding().getId() %></span>
                                </td>
                                <td><%= x.getBuilding().getComune().getNomeComune() %></td>
                                <td><%= x.getBuilding().getComune().getProvincia().getNomeProvincia() %></td>
                                <td>
                                    <span class="badge bg-info">
                                        <%= x.getMediazioneImmobile().getMediazione() %>
                                    </span>
                                </td>
                                <td class="text-end fw-bold"><%= currencyFormatter.format(x.getPrezzo()) %></td>
                                <td><%= x.getBuilding().getLocali() %></td>
                                <td><%= x.getCreatedAt().format(formatter) %></td>
                                <td class="text-center">
                                    <div class="btn-group" role="group">
                                        <a href="get-listing?id=<%= x.getListing_id() %>" 
                                           class="btn btn-primary btn-sm me-2" 
                                           title="Visualizza dettagli">
                                            <i class="bi bi-eye me-1"></i>Dettagli
                                        </a>
                                        <form action="status" method="post" class="d-inline me-2">
                                            <input type="hidden" name="id" value="<%= x.getListing_id() %>">
                                            <input type="hidden" name="newStatus" value="<%= x.getMediazioneImmobile().getMediazione().equals("Affitto") ? "RENT" : "SELL" %>">
                                            <button type="submit" 
                                                    class="btn btn-success btn-sm" 
                                                    title="Approva annuncio">
                                                <i class="bi bi-check-lg me-1"></i>Approva
                                            </button>
                                        </form>
                                        <form action="status" method="post" class="d-inline">
                                            <input type="hidden" name="id" value="<%= x.getListing_id() %>">
                                            <input type="hidden" name="newStatus" value="REJECTED">
                                            <button type="submit" 
                                                    class="btn btn-danger btn-sm" 
                                                    title="Rifiuta richiesta">
                                                <i class="bi bi-x-circle me-1"></i>Rifiuta
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        <% } } else { %>
                        
                            <tr>
                                <td colspan="8" class="text-center py-5">
                                    <i class="bi bi-clipboard-check fs-1 text-muted"></i>
                                    <p class="mt-2 text-muted">Nessun immobile in attesa di approvazione</p>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<%@ include file="js.jsp" %>
<%@ include file="footer.jsp" %>
</body>
</html>