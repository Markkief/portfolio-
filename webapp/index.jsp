<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="org.generationitaly.casanova.persistence.entity.MediazioneImmobile" %>
<%@ page import="org.generationitaly.casanova.persistence.entity.Provincia" %>
<%@ page import="org.generationitaly.casanova.persistence.entity.Comune" %>
<%@ page import="org.generationitaly.casanova.persistence.entity.StatoImmobile" %>
<%@ page import="org.generationitaly.casanova.persistence.entity.TipologiaImmobile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CasaNova </title>
		<%@ include file="css.jsp" %>
		<link rel="stylesheet" type="text/css" href="css/pulsante.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
		<style>
			.hidden{
				display:none !important;
			}
		</style>
		<!--  <script type="text/javascript" src="js/pulsante.js"></script>-->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<script>
		
		function closeAllDropdowns() {
		    const dropdowns = document.querySelectorAll(".dropdown-content.show");
		    dropdowns.forEach(dropdown => dropdown.classList.remove("show"));
		}
		
		function toogleDropdown(){
			closeAllDropdowns();
			const pricedropdown = document.getElementById("prezzoDropdown");
			console.log(pricedropdown);
			pricedropdown.classList.toggle("show");
		
		}
	
		function toogleDropdownSupe(){
			closeAllDropdowns();
			const surfacedropdown = document.getElementById("superficieDropdown");
			console.log(surfacedropdown);
			surfacedropdown.classList.toggle("show");
			
		}
		
		window.onclick = function(event) {
			if(!event.target.closest(".dropdown-content") && !event.target.matches(".btn")){
				closeAllDropdowns();
			}
				
		}
		
		</script>
	</head>
		<body>
		<%@ include file="navbar.jsp" %>
		<% 
			List<MediazioneImmobile> listaMediazione= (List<MediazioneImmobile>) request.getAttribute("mediazioni");
			List<Provincia> listaProvincia= (List<Provincia>) request.getAttribute("provincie");
			List<Comune> listaComune= (List<Comune>) request.getAttribute("comuni");
			List<StatoImmobile> listaStatoImmobile= (List<StatoImmobile>) request.getAttribute("statiImmobile");
			List<TipologiaImmobile> tipologie = (List<TipologiaImmobile>) request.getAttribute("tipologie");
		%>
		<br>
		<br>
		<form>
		<!-- Sezione Inferiore - Azzurra -->
		<section class="custom-blue text-white d-flex align-items-center justify-content-center half-height" style="min-height: 67vh;">
        	<div class="container text-center">
  			<div class="row">
        		<h1>CasaNova</h1>
        		<h2>Inizia la tua ricerca oggi stesso!</h2>
        		<p>Esplora migliaia di annunci in tutta Italia.</p>
        		<br>
        	</div>
        	</div>
  				<div class="container text-center">
  					<div class="row">
  						<div class="col-9">
  						  	<div class="row">
							<% 
								for (MediazioneImmobile mediazione : listaMediazione) {	
							%>
								<input type="radio" name="mediazione" class="btn-check" id="btn_mediazione_<%=mediazione.getIdMediazione()%>" value="<%=mediazione.getIdMediazione() %>" autocomplete="off">
								<label class="btn btn-primary" for="btn_mediazione_<%=mediazione.getIdMediazione()%>"><%=mediazione.getMediazione() %></label>
							<%}%>
  						  	</div>
  						  
							 	<div class="row">
							  	<div class="col-md-4 mb-3">
							  	<select name="tipologia" id="idTipologia" class="form-select">
							  		<option value="">Tipologia</option>
  						  		<% for(TipologiaImmobile tipologia: tipologie) {%>
  						  				<option value="<%=tipologia.getId()%>">
  						  				<%=tipologia.getTipologia() %>
  						  				</option>
  						  		<%}%>
  						  			</select>
  						  		</div>
  						  		<div class="col-md-4 mb-3">
  						  		<select name="statoImmobile" id="idStatoImmobile" class="form-select">
  						  		<option value="">Stato Immobile</option>
  						  		 <% for (StatoImmobile statoImmobile : listaStatoImmobile) {%>

  						  				<option value="<%=statoImmobile.getIdStatoImmobile()%>"><%=statoImmobile.getStato() %></option> 						  		
  						  			<%} %>
  						  		</select> 
  						  		</div>
  						  		<div class="col-md-4 mb-3">
  						  			<select id="provinciaDropdown" name="idProvincia" class="form-select" onchange="aggiornaComuni(this.value)"> 
									    <option value="">Provincia</option>
									    <% for (Provincia provincia : listaProvincia) { %>
									        <option value="<%=provincia.getIdProvincia()%>">
									            <%=provincia.getNomeProvincia()%>
									        </option>
									    <% } %>
									</select>
  						  		</div>
  						  		</div>
  						  		<div class="mb-3">
  						  			<select id ="elencoComuni" name="comune" class="form-select">
  						  				<option value="">Comune</option>
  						  			</select>
  						  		</div>
						
					
  					
  					<div class="row">
						<div class="col-md-6">
  							<button type="button" class="btn btn-secondary w-100"  onclick="toogleDropdown()">Prezzo</button>
  							<div class="dropdown-content" id="prezzoDropdown"> 
  								<label for="prezzoMin" style="color:black">Prezzo Min:</label>
  								<input type="number" id="prezzoMin" name="prezzoMin" class="form-control" placeholder="Inserisci valore">
  								<label for="prezzoMax" class="control-label" style="color:black">Prezzo Max:</label>
  								<input type="number" id="prezzoMax" name="prezzoMax" class="form-control"  placeholder="Inserisci valore">
  							</div>
  						</div>
  						<div class="col-md-6">
  							 <button type="button" class="btn btn-secondary w-100" onclick="toogleDropdownSupe()">Superficie</button>
  							<div class="dropdown-content" id="superficieDropdown">
  								<label for="superficieMin" style="color:black">Superficie Min:</label>
  								<input type="number" id="superficieMin" name="superficieMin" class="form-control" placeholder="Inserisci valore">
  								<label for="superficieMax" style="color:black">Superficie Max:</label>
  								<input type="number" id="superficieMax" name="superficieMax" class="form-control" placeholder="Inserisci valore">
  							</div>
  						</div>
  					</div>
  					<div class="mt-2">
 						 <button class="btn btn-primary btn-lg ml-3" type="submit" id="immobileRisu">Cerca</button>
  					</div>  
  					
  				</div>
    		</div>
    								 

  							
    		</div>
    		</div>
		</section>
	</form>

	<!-- Sezione Superiore - Bianca -->
	<section id="welcomeSection" class="bg-white text-dark d-flex align-items-center justify-content-center half-height">
  		<div class="text-center">
      		<h1>Benvenuto su CasaNova</h1>
     		 <p>Trova la tua casa ideale con facilità.</p>
  		</div>
	</section>
	<div id="wrapperImmobili"></div>
	<script>
		
			function addImmobileToPage(immobile, delayIndex){
				console.log("SONO DENTRO addImmobileToPage");
				if(delayIndex === 0){
					$('#wrapperImmobili').empty();
				}
				console.log("IMMOBILEE: ",immobile);
				const divImmobile=`
				 <div class="col-md-12 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-light">
                        <span class="badge bg-warning text-dark me-2"><span class="bi bi-lightning-charge"></span> Sotto offerta</span>
                    </div>
                    <div class="row g-0">
                        <div class="col-md-5 position-relative">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="\${immobile.listing.immagineImmobile.img}" class="d-block w-100" alt="Immobile">
                                    </div>
                                </div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h5 class="card-title">\${immobile.listing.title} <span class="bi bi-patch-check-fill text-primary" data-bs-toggle="tooltip" title="Verificato"></span></h5>
                                <p class="text-muted"><span class="bi bi-geo-alt-fill text-danger me-1"></span> \${immobile.indirizzo}</p>
                                <p class="card-text">\${immobile.listing.descrizione}</p>
                                
                                <div class="d-flex flex-wrap mb-3">
                                    <div class="me-4"><span class="bi bi-door-closed me-1"></span> \${immobile.locali} locali</div>
                                    <div class="me-4"><span class="bi bi-basket me-1"></span> \${immobile.bagno} bagni</div>
                                    <div class="me-4"><span class="bi bi-rulers me-1"></span> \${immobile.superficie} m²</div>
                                    <div><span class="bi bi-water me-1"></span> Piscina</div>
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="fw-bold mb-0 text-primary fs-4">€\${immobile.listing.prezzo}</p>
                                        <small class="text-muted">€\${parseFloat((immobile.listing.prezzo / immobile.superficie).toFixed(2))}/m²</small>
                                    </div>
                                    <div>
                                        <a target="_blank" href="get-listing?id=\${immobile.listing.listing_id}" class="btn btn-primary me-2"><span class="bi bi-info-circle me-1"></span> Dettagli</a>
                                        <button type="button" class="btn btn-outline-primary" data-bs-toggle="tooltip" title="Contatta agente">
                                            <span class="bi bi-telephone"></span>
                                        </button>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-between align-items-center mt-3">
                                    <div>
                                        <small class="text-muted"><span class="bi bi-clock me-1"></span> Inserito 1 settimana fa</small>
                                    </div>
                                    <div>
                                    <form action="like" method="post" style="display: inline;">
                                    <input type="hidden" name="listingId" value="\${immobile.listing.listing_id}">
                                    <button type="submit" class="btn btn-primary btn-favorite">
                                      <i class="bi bi-heart"></i>
                                      <span>Aggiungi ai preferiti</span>
                                    </button>
                                  </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			`;	

				
				var divImmobileOBJ = $(divImmobile);
				
				$(divImmobileOBJ).hide();
				
				$('#wrapperImmobili').append(divImmobileOBJ);
				
				$(divImmobileOBJ).delay((delayIndex +1) *300).fadeIn('slow');
			}
		
			$(document).ready(function(){
				$('#immobileRisu').click(function(event){
					event.preventDefault();
					const welcomeSection = document.getElementById("welcomeSection");
					console.log("welcomeSection", welcomeSection);
					if(welcomeSection){
						welcomeSection.classList.add("hidden");
					}
					
					console.log("idMediazione: ", $("input[name='mediazione']:checked").val());
					console.log("idStatoImmobile: ", $('#idStatoImmobile').find(":selected").val());
					console.log("idProvincia: ",$('#provinciaDropdown').find(":selected").val());
					console.log("idComune: ", $('#elencoComuni').find(":selected").val());
					console.log("idTipologia: ", $('#idTipologia').find(":selected").val());
					console.log("prezzoMin: ",$('#prezzoMin').val());
					console.log("prezzoMax: ",$('#prezzoMax').val());
					console.log("superficieMin: ",$('#superficieMin').val());
					console.log("superficieMax: ",$('#superficieMax').val());
					var dataJson = {
						idMediazione: $("input[name='mediazione']:checked").val(),
						idStatoImmobile: $('#idStatoImmobile').find(":selected").val(),
						idProvincia: $('#provinciaDropdown').find(":selected").val(),
						idComune: $('#elencoComuni').find(":selected").val(),
						idTipologia: $('#idTipologia').find(":selected").val(),
						prezzoMin: $('#prezzoMin').val(),
						prezzoMax: $('#prezzoMax').val(),
						superficieMin: $('#superficieMin').val(),
						superficieMax: $('#superficieMax').val()
					};
					$.ajax({
						url: "searchEntity",
						method: "POST",
						dataType: "json",
						data: dataJson,
						success: function(data){
							$('#wrapperImmobili').empty();
							
							if(data.length === 0){
								$('#wrapperImmobili').html('<div align="center"> Non ci sono immobili presenti con quelle caratteristiche!');
							} else{
								$.each(data, function(i, immobile){
									addImmobileToPage(immobile,i);
								});
							}
						},
						error: function(xhr, status, error){
							console.error("Errore:", error);
							console.log("Dettagli:", xhr.responseText);
						}
					})
				})
			});
			
			
			function aggiornaComuni(idProvinciaSelezionata){
				console.log("SONO DENTRO aggiornaComuni");
				var comuneDropdown = document.getElementById('elencoComuni');
				comuneDropdown.innerHTML = '<option value="">Seleziona Comune</option>';
				var listaComuni = [
					<% for(Comune comune: listaComune) {%>
					{
						idComune: "<%=comune.getIdComune()%>",
						idProvincia: "<%= comune.getProvincia().getIdProvincia()%>",
						nomeComune: "<%= comune.getNomeComune()%>"
					}<%if(!comune.equals(listaComune.get(listaComune.size()-1))) {%>, <%}%>
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
		

<%@ include file="js.jsp" %>
<%@ include file="footer.jsp" %>  	
</body>
</html>