<%@ page import="org.generationitaly.casanova.persistence.entity.Listing"%>
<%@ page import="org.generationitaly.casanova.persistence.dto.RevisorProfileDTO"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<% 
  RevisorProfileDTO profile = (RevisorProfileDTO) request.getSession().getAttribute("profile");
  List<Listing> lis = profile.getPendingList();
  NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(Locale.ITALY);
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
%>

<div class="card shadow-sm mb-4">
  <div class="card-header bg-primary text-white py-3">
    <h5 class="mb-0">
      <i class="bi bi-clipboard-check me-2"></i>Lista Immobili in Attesa di Approvazione
    </h5>
  </div>
  
  <div class="table-responsive">
    <table class="table table-hover align-middle mb-0">
      <thead>
        <tr class="bg-light">
          <th scope="col" class="ps-3">ID</th>
          <th scope="col">Comune</th>
          <th scope="col">Provincia</th>
          <th scope="col">Tipo</th>
          <th scope="col">Prezzo</th>
          <th scope="col">Locali</th>
          <th scope="col">Data</th>
          <th scope="col" class="text-center">Azioni</th>
        </tr>
      </thead>
      <tbody>
        <% if (lis != null && !lis.isEmpty()) {
          for (Listing x : lis) { %>
          <tr>
            <td class="ps-3">
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
                  <input type="hidden" name="newStatus" value="PENDING">
                  <button type="button" 
                          class="btn btn-danger btn-sm" 
                          data-bs-toggle="modal" 
                          data-bs-target="#deleteModal<%= x.getListing_id() %>" 
                          data-listing-id="<%= x.getListing_id() %>" 
                          data-comune="<%= x.getBuilding().getComune().getNomeComune() %>" 
                          data-building-id="<%= x.getBuilding().getId() %>"
                          title="Rifiuta richiesta">
                    <i class="bi bi-x-circle me-1"></i>Rifiuta
                  </button>
                </form>
              </div>
            </td>
          </tr>

          <!-- Delete Confirmation Modal -->
          <div class="modal fade" id="deleteModal<%= x.getListing_id() %>" tabindex="-1" aria-labelledby="deleteModalLabel<%= x.getListing_id() %>" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="deleteModalLabel<%= x.getListing_id() %>">
                    <i class="bi bi-exclamation-triangle text-danger me-2"></i>Conferma Rifiuto
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p>Sei sicuro di voler rifiutare la richiesta per l'immobile a <strong id="deleteComune<%= x.getListing_id() %>"></strong> con ID <strong id="deleteId<%= x.getListing_id() %>"></strong>?</p>
                  <p class="text-danger mb-0"><small>Questa azione non può essere annullata.</small></p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    <i class="bi bi-x-circle me-2"></i>Annulla
                  </button>
                  <form action="status" method="post" style="display: inline;">
                    <input type="hidden" name="id" id="deleteListingId<%= x.getListing_id() %>">
                    <input type="hidden" name="newStatus" value="PENDING">
                    <button type="submit" class="btn btn-danger">
                      <i class="bi bi-x-circle me-2"></i>Conferma Rifiuto
                    </button>
                  </form>
                </div>
              </div>
            </div>
          </div>
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

<style>
.table-responsive {
  margin-bottom: 2rem;
  border-radius: 0.5rem;
  overflow: visible;
  position: relative;
  z-index: 1;
}

.table {
  margin-bottom: 0;
  position: relative;
  z-index: 1;
}

.table th {
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.85rem;
  letter-spacing: 0.5px;
  white-space: nowrap;
  position: relative;
  z-index: 1;
}

.table td {
  vertical-align: middle;
  white-space: nowrap;
  position: relative;
  z-index: 1;
}

.btn-group {
  display: flex;
  gap: 0.5rem;
  flex-wrap: nowrap;
  position: relative;
  z-index: 2;
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
  position: relative;
  z-index: 2;
}

.btn-group .btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.btn-group .btn i {
  font-size: 1rem;
  margin-right: 0.25rem;
}

.badge {
  font-weight: 500;
  padding: 0.5em 0.75em;
  position: relative;
  z-index: 1;
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

<script>
document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('[data-bs-toggle="modal"]').forEach(button => {
    button.addEventListener('click', function() {
      const listingId = this.getAttribute('data-listing-id');
      const comune = this.getAttribute('data-comune');
      const buildingId = this.getAttribute('data-building-id');
      
      document.getElementById('deleteComune' + listingId).textContent = comune;
      document.getElementById('deleteId' + listingId).textContent = '#' + buildingId;
      document.getElementById('deleteListingId' + listingId).value = listingId;
    });
  });
});
</script>