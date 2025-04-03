<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ page import="org.generationitaly.casanova.persistence.entity.StatoImmobile"%>
	<%@ page import="org.generationitaly.casanova.persistence.entity.MediazioneImmobile"%>
	<%@ page import="org.generationitaly.casanova.persistence.entity.TipologiaImmobile"%>
	<%@ page import="org.generationitaly.casanova.persistence.entity.Comune"%>
	<%@ page import="org.generationitaly.casanova.persistence.entity.Provincia"%>
	<%@ page import="org.generationitaly.casanova.persistence.entity.Immobile"%>
	<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CasaNova - Inserisci Annuncio</title>
<%@ include file="css.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<% 
		String errore = request.getParameter("errore");
		List<Comune> comuni = (List<Comune>) request.getAttribute("comuni");
		List<Provincia> provincie = (List<Provincia>) request.getAttribute("provincie");
		List<MediazioneImmobile> mediazioni = (List<MediazioneImmobile>) request.getAttribute("mediazioni");
		List<StatoImmobile> statiImmobile = (List<StatoImmobile>) request.getAttribute("statiImmobile");
		List<TipologiaImmobile> tipologie = (List<TipologiaImmobile>) request.getAttribute("tipologie");
	%>

	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="card shadow-sm border-0">
					<div class="card-body p-4 p-md-5">
						<div class="text-center mb-5">
							<h1 class="h2 mb-3">Inserisci il tuo annuncio</h1>
							<p class="text-muted">Compila tutti i campi richiesti per pubblicare il tuo annuncio</p>
						</div>

						<% if (errore != null) { %>
							<div class="alert alert-danger alert-dismissible fade show" role="alert">
								<i class="bi bi-exclamation-triangle me-2"></i>Errore: verifica i campi!
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						<% } %>

						<form method="post" action="addimmobile" class="needs-validation" novalidate>
							<!-- Informazioni Principali -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-info-circle me-2"></i>Informazioni Principali
									</h5>
									<div class="row g-3">
										<div class="col-md-6">
											<label for="title" class="form-label">Titolo dell'annuncio</label>
											<input name="title" type="text" class="form-control" id="title" 
												placeholder="Es: Appartamento luminoso in centro" required>
										</div>
										<div class="col-md-6">
											<label for="prezzo" class="form-label">Prezzo (€)</label>
											<div class="input-group">
												<input name="prezzo" type="number" class="form-control" id="prezzo" 
													placeholder="0" min="0" required>
												<span class="input-group-text">€</span>
											</div>
										</div>
										<div class="col-md-6">
											<label for="idMediazioneImmobile" class="form-label">Mediazione</label>
											<select name="idMediazioneImmobile" class="form-select" id="idMediazioneImmobile" required>
												<option value="">Seleziona mediazione</option>
												<% for(MediazioneImmobile x : mediazioni){ %>
													<option value="<%=x.getIdMediazione() %>"><%=x.getMediazione()%></option>
												<% } %>
											</select>
										</div>
										<div class="col-md-6">
											<label for="idTipologiaImmobile" class="form-label">Tipologia</label>
											<select name="idTipologiaImmobile" class="form-select" id="idTipologiaImmobile" required>
												<option value="">Seleziona tipologia</option>
												<% for(TipologiaImmobile x : tipologie){ %>
													<option value="<%=x.getId() %>"><%=x.getTipologia() %></option>
												<% } %>
											</select>
										</div>
									</div>
								</div>
							</div>

							<!-- Ubicazione -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-geo-alt me-2"></i>Ubicazione
									</h5>
									<div class="row g-3">
										<div class="col-md-6">
											<label for="idProvincia" class="form-label">Provincia</label>
  						  			<select id="provinciaDropdown" name="idProvincia" class="form-select" onchange="aggiornaComuni(this.value)"> 
									    <option value="">Provincia</option>
									    <% for (Provincia provincia : provincie) { %>
									        <option value="<%=provincia.getIdProvincia()%>">
									            <%=provincia.getNomeProvincia()%>
									        </option>
									    <% } %>
									</select>
										</div>
										<div class="col-md-6">
										<label for="idComune" class="form-label">Città</label>
  						  				<select id ="idComune" name="idComune" class="form-select">
  						  				<option value="">Comune</option>
  						  				</select>
										</div>
										<div class="col-md-6">
											<label for="indirizzo" class="form-label">Inserisci l'indirizzo dell'immobile:</label>
										<textarea name="indirizzo" class="form-control" id="indirizzo" rows="2" 
											placeholder="Inserisci l'indirizzo dell'immobile..." required></textarea>
										</div>
										<div class="col-md-6">
											<label for="img" class="form-label">Inserisci l'immagine'immobile:</label>
										<textarea name="img" class="form-control" id="img" rows="2" 
											placeholder="Inserisci l'indirizzo dell' immagine appartenente all'immobile..." required></textarea>
										</div>
									</div>
								</div>
							</div>

							<!-- Caratteristiche -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-house-door me-2"></i>Caratteristiche
									</h5>
									<div class="row g-3">
										<div class="col-md-6">
											<label for="superficie" class="form-label">Superficie (m²)</label>
											<div class="input-group">
												<input name="superficie" type="number" class="form-control" id="superficie" 
													placeholder="0" min="0" required>
												<span class="input-group-text">m²</span>
											</div>
										</div>
										<div class="col-md-6">
											<label for="locali" class="form-label">Numero Locali</label>
											<input name="locali" type="number" class="form-control" id="locali" 
												placeholder="0" min="0" required>
										</div>
										<div class="col-md-6">
											<label for="bagno" class="form-label">Numero Bagni</label>
											<input name="bagno" type="number" class="form-control" id="bagno" 
												placeholder="0" min="0" required>
										</div>
										<div class="col-md-6">
											<label for="piano" class="form-label">Piano</label>
											<input name="piano" type="number" class="form-control" id="piano" 
												placeholder="0" required>
										</div>
									</div>
								</div>
							</div>

							<!-- Spazi Esterni -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-tree me-2"></i>Spazi Esterni
									</h5>
									<div class="row g-3">
									<div class="col-md-6">
											<label for="giardinoe" class="form-label">Giardino</label>
											<select name="giardino" class="form-select" id="giardino" required>
												<option value="1">Si</option>
												<option value="0">No</option>
											</select>
										</div>
										<div class="col-md-6">
											<label for="balcone" class="form-label">Balcone (m²)</label>
											<div class="input-group">
												<input name="balcone" type="number" class="form-control" id="balcone" 
													placeholder="0" min="0" >
												<span class="input-group-text">m²</span>
											</div>
										</div>
										<div class="col-md-6">
											<label for="terrazzo" class="form-label">Terrazzo (m²)</label>
											<div class="input-group">
												<input name="terrazzo" type="number" class="form-control" id="terrazzo" 
													placeholder="0" min="0">
												<span class="input-group-text">m²</span>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Servizi -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-gear me-2"></i>Servizi
									</h5>
									<div class="row g-3">
										<div class="col-md-6">
											<label for="ascensore" class="form-label">Ascensore</label>
											<select name="ascensore" class="form-select" id="ascensore" required>
												<option value="true">Si</option>
												<option value="false">No</option>
											</select>
										</div>
										<div class="col-md-6">
											<label for="garage" class="form-label">Garage</label>
											<select name="garage" class="form-select" id="garage" required>
												<option value="true">Si</option>
												<option value="false">No</option>
											</select>
										</div>
										<div class="col-md-6">
											<label for="idStatoImmobile" class="form-label">Stato Immobile</label>
											<select name="idStatoImmobile" class="form-select" id="idStatoImmobile" required>
												<option value="">Seleziona stato</option>
												<% for(StatoImmobile x : statiImmobile){ %>
													<option value="<%=x.getIdStatoImmobile()%>"><%=x.getStato()%></option>
												<% } %>
											</select>
										</div>
									</div>
								</div>
							</div>

							<!-- Descrizione -->
							<div class="card bg-light mb-4">
								<div class="card-body">
									<h5 class="card-title mb-4">
										<i class="bi bi-pencil me-2"></i>Descrizione
									</h5>
									<div class="mb-3">
										<label for="descrizione" class="form-label">Descrizione dettagliata</label>
										<textarea name="descrizione" class="form-control" id="descrizione" rows="5" 
											placeholder="Descrivi le caratteristiche principali dell'immobile..." required></textarea>
									</div>
								</div>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-lg px-5">
									<i class="bi bi-check-circle me-2"></i>Pubblica Annuncio
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="js.jsp"%>
	<%@ include file="footer.jsp"%>

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


				function aggiornaComuni(idProvinciaSelezionata){
				console.log("SONO DENTRO aggiornaComuni");
				var comuneDropdown = document.getElementById('idComune');
				comuneDropdown.innerHTML = '<option value="">Seleziona Comune</option>';
				var listaComuni = [
					<% for(Comune comune: comuni) {%>
					{
						idComune: "<%=comune.getIdComune()%>",
						idProvincia: "<%= comune.getProvincia().getIdProvincia()%>",
						nomeComune: "<%= comune.getNomeComune()%>"
					}<%if(!comune.equals(comuni.get(comuni.size()-1))) {%>, <%}%>
					<%}%>
				];
				
				console.log("listaComuni", listaComuni);
				listaComuni.forEach(function(comune){
					if(comune.idProvincia == idProvinciaSelezionata){
						comuneDropdown.innerHTML += '<option value="' + comune.idComune + '">' + comune.nomeComune + '</option>';
					}
				})
			}	
		</script>
</body>
</html>