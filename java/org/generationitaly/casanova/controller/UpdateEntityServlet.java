package org.generationitaly.casanova.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.persistence.dto.ImmLisDTO;
import org.generationitaly.casanova.persistence.entity.Comune;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.MediazioneImmobile;
import org.generationitaly.casanova.persistence.entity.Provincia;
import org.generationitaly.casanova.persistence.entity.StatoImmobile;
import org.generationitaly.casanova.persistence.entity.TipologiaImmobile;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.persistence.repository.ComuneRepository;
import org.generationitaly.casanova.persistence.repository.ImmLisRepository;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;
import org.generationitaly.casanova.persistence.repository.MediazioneImmobileRepository;
import org.generationitaly.casanova.persistence.repository.ProvinciaRepository;
import org.generationitaly.casanova.persistence.repository.StatoImmobileRepository;
import org.generationitaly.casanova.persistence.repository.TipologiaImmobileRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ComuneRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmLisRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.MediazioneImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ProvinciaRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.StatoImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.TipologiaImmobileRepositoryImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 * Updates a listing in the database
 */

 @WebServlet("/updateimmobile")
public class UpdateEntityServlet extends HttpServlet{

	private ImmLisRepository immLis = ImmLisRepositoryImpl.getInstance();
	private ImmobileRepository immobileRepo = ImmobileRepositoryImpl.getInstance();
	private ProvinciaRepository provinciaRepo = ProvinciaRepositoryImpl.getInstance();
	private ComuneRepository comuneRepo = ComuneRepositoryImpl.getInstance();
	private StatoImmobileRepository statoImmobileRepo = StatoImmobileRepositoryImpl.getInstance();
	private MediazioneImmobileRepository mediazioneImmobileRepo = MediazioneImmobileRepositoryImpl.getInstance();
	private TipologiaImmobileRepository tipologiaImmobileRepo = TipologiaImmobileRepositoryImpl.getInstance();
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		try {
			long idImmobile = Long.parseLong(request.getParameter("idImmobile"));
			
			Immobile immobile = immobileRepo.findById(idImmobile);
			
	        if (immobile == null) {
	            request.setAttribute("errorMessage", "Immobile non trovato");
	            request.getRequestDispatcher("paginaPrincipale.jsp").forward(request, response);
	            return;
	        }
	        
	        List<Provincia> provincie = provinciaRepo.findAll();
	        List<Comune> comuni = comuneRepo.findAll();
	        List<StatoImmobile> statiImmobile = statoImmobileRepo.findAll();
	        List<MediazioneImmobile> mediazioni = mediazioneImmobileRepo.findAll();
	        List<TipologiaImmobile> tipologie = tipologiaImmobileRepo.findAll();
	        
			request.setAttribute("immobile", immobile);
			
			request.setAttribute("provincie", provincie);
			request.setAttribute("statiImmobile", statiImmobile);
			request.setAttribute("comuni", comuni);
			request.setAttribute("mediazioni", mediazioni);
			request.setAttribute("tipologie", tipologie);

			request.getRequestDispatcher("update-announcement.jsp").forward(request, response);
		
		} catch(NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Id immobile non valido");
			
		}catch (Exception e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore interno del server");
		}

	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		long idImmobile = Long.parseLong(request.getParameter("idImmobile"));
		int prezzo = Integer.parseInt(request.getParameter("prezzo"));
		//float superficie = Float.parseFloat(request.getParameter("superficie"));
		int superficie = Integer.parseInt(request.getParameter("superficie"));
		long idProvincia = Long.parseLong(request.getParameter("idProvincia"));
		long idComune = Long.parseLong(request.getParameter("idComune"));
		String indirizzo = request.getParameter("indirizzo");
		int locali = Integer.parseInt(request.getParameter("locali"));
		boolean ascensore = Boolean.parseBoolean(request.getParameter("ascensore"));
		int terrazzo = Integer.parseInt(request.getParameter("terrazzo"));
		int giardino = Integer.parseInt(request.getParameter("giardino"));
		boolean garage = Boolean.parseBoolean(request.getParameter("garage"));
		int balcone = Integer.parseInt(request.getParameter("balcone"));
		int piano = Integer.parseInt(request.getParameter("piano"));
		int bagno = Integer.parseInt(request.getParameter("bagno"));
		String descrizione = request.getParameter("descrizione");
		long idStatoImmobile = Long.parseLong(request.getParameter("idStatoImmobile"));
		long idMediazioneImmobile = Long.parseLong(request.getParameter("idMediazioneImmobile"));
		long idTipologiaImmobile = Long.parseLong(request.getParameter("idTipologiaImmobile"));
		
		Provincia provincia = provinciaRepo.findById(idProvincia);
		Comune comune = comuneRepo.findById(idComune);
		
		StatoImmobile statoImmobile = statoImmobileRepo.findById(idStatoImmobile);
		MediazioneImmobile mediazioneImmobile = mediazioneImmobileRepo.findById(idMediazioneImmobile);
		TipologiaImmobile tipologiaImmobile = tipologiaImmobileRepo.findById(idTipologiaImmobile);
		
		Map<String, String> errorMessages = new HashMap<>();
		if(prezzo <= 0) {
			errorMessages.put("prezzo", "Il prezzo deve essere maggiore di zero.");
		}
		if(superficie <= 0) {
			errorMessages.put("superficie", "La superficie deve essere maggiore di zero.");
		}
		if(indirizzo == null || indirizzo.isEmpty()) {
			errorMessages.put("indirizzo", "L'indirizzo è obbligatori");
		}
		if(locali == 0) {
			errorMessages.put("locali", "Devi inserire i numero dei locali");
		}	
		if(provincia == null) {
			errorMessages.put("idProvincia", "Provincia non trovata");
		}
		if(comune == null) {
			errorMessages.put("idComune", "comune non trovato");
		}
		if(statoImmobile == null) {
			errorMessages.put("idStatoImmobile", "statoImmobile non trovato");
		}
		if(mediazioneImmobile == null) {
			errorMessages.put("idMediazioneImmobile", "mediazioneImmobile non trovato");
		}
		
		if(!errorMessages.isEmpty()) {
			request.setAttribute("errorMessages", errorMessages);
			request.getRequestDispatcher("aggiuntaImmobile.jsp").forward(request, response);
			return;
		}
		User user = new User();
		user.setUser_id(1);
		Immobile immobile = new Immobile();
		Listing listing = new Listing();
		listing.setPrezzo(prezzo);
		immobile.setSuperficie(superficie);
		immobile.setProvincia(provincia);
		immobile.setComune(comune);
		immobile.setIndirizzo(indirizzo);
		immobile.setLocali(locali);
		immobile.setAscensore(ascensore);
		immobile.setTerrazzo(terrazzo);
		immobile.setGiardino(giardino);
		immobile.setGarage(garage);
		immobile.setBagno(bagno);
		immobile.setPiano(piano);
		//recuperare status da front'end
		listing.setStatus(ListingStatus.RENT);
		listing.setDescrizione(descrizione);
		listing.setStatoImmobile(statoImmobile);
		listing.setMediazioneImmobile(mediazioneImmobile);
		immobile.setBalcone(balcone);
		immobile.setTipologiaImmobile(tipologiaImmobile);
		immobile.setId(idImmobile);
		listing.setUser(user);
		
		ImmLisDTO dto = new ImmLisDTO();
		dto.setIm(immobile);
		dto.setLi(listing);
		immLis.update(dto);
		
		response.sendRedirect("index.jsp");
	}
	
}
