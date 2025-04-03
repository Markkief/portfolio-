package org.generationitaly.casanova.controller;

import java.io.IOException;
import java.util.List;

import org.generationitaly.casanova.persistence.entity.Comune;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.MediazioneImmobile;
import org.generationitaly.casanova.persistence.entity.Provincia;
import org.generationitaly.casanova.persistence.entity.SearchImmobileDTO;
import org.generationitaly.casanova.persistence.entity.StatoImmobile;
import org.generationitaly.casanova.persistence.entity.TipologiaImmobile;
import org.generationitaly.casanova.persistence.repository.ComuneRepository;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;
import org.generationitaly.casanova.persistence.repository.MediazioneImmobileRepository;
import org.generationitaly.casanova.persistence.repository.ProvinciaRepository;
import org.generationitaly.casanova.persistence.repository.StatoImmobileRepository;
import org.generationitaly.casanova.persistence.repository.TipologiaImmobileRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ComuneRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.MediazioneImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ProvinciaRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.StatoImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.TipologiaImmobileRepositoryImpl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/* 
 * Generic search endpoint
 */


@WebServlet("/searchEntity")
public class SearchEntityServlet extends HttpServlet {

	private ImmobileRepository immobileRepository = ImmobileRepositoryImpl.getInstance();
	private ProvinciaRepository provinciaRepository = ProvinciaRepositoryImpl.getInstance();
	private ComuneRepository comuneRepository = ComuneRepositoryImpl.getInstance();
	private StatoImmobileRepository statoImmobileRepository = StatoImmobileRepositoryImpl.getInstance();
	private MediazioneImmobileRepository mediazioneImmobileRepository = MediazioneImmobileRepositoryImpl.getInstance();
	private TipologiaImmobileRepository tipologiaImmobileRepository = TipologiaImmobileRepositoryImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		List<Provincia> provincie = provinciaRepository.findAll();
		List<Comune> comuni = comuneRepository.findAll();
		List<StatoImmobile> statiImmobile = statoImmobileRepository.findAll();
		List<MediazioneImmobile> mediazioni = mediazioneImmobileRepository.findAll();
		List<TipologiaImmobile> tipologie = tipologiaImmobileRepository.findAll();

		System.out.println(mediazioni);
		request.setAttribute("provincie", provincie);
		request.setAttribute("statiImmobile", statiImmobile);
		request.setAttribute("comuni", comuni);
		request.setAttribute("mediazioni", mediazioni);
		request.setAttribute("tipologie", tipologie);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		System.out.println("idMediazione: "+request.getParameter("idMediazione"));
		System.out.println("idProvincia: "+request.getParameter("idProvincia"));
		System.out.println("idComune: "+request.getParameter("idComune"));
		System.out.println("idStatoImmobile: "+request.getParameter("idStatoImmobile"));
		System.out.println("idTipologia: " + request.getParameter("idTipologia"));
		System.out.println("prezzoMin: "+request.getParameter("prezzoMin"));
		System.out.println("prezzoMax: "+request.getParameter("prezzoMax"));
		System.out.println("superficieMin: "+request.getParameter("superficieMin"));
		System.out.println("superficieMax: "+request.getParameter("superficieMax"));
		SearchImmobileDTO searchImmobile = new SearchImmobileDTO();
		
		if (request.getParameter("idMediazione") != null && !request.getParameter("idMediazione").isEmpty())
			searchImmobile.setIdMediazione(Long.parseLong(request.getParameter("idMediazione")));
		
		if (request.getParameter("idProvincia") != null && !request.getParameter("idProvincia").isEmpty())
			searchImmobile.setIdProvincia(Long.parseLong(request.getParameter("idProvincia")));

		if (request.getParameter("idComune") != null && !request.getParameter("idComune").isEmpty())
			searchImmobile.setIdComune(Long.parseLong(request.getParameter("idComune")));

		if (request.getParameter("idStatoImmobile") != null && !request.getParameter("idStatoImmobile").isEmpty())
			searchImmobile.setIdStatoImmobile(Long.parseLong(request.getParameter("idStatoImmobile")));
		
		if (request.getParameter("idTipologia") != null && !request.getParameter("idTipologia").isEmpty())
			searchImmobile.setIdTipologia(Long.parseLong(request.getParameter("idTipologia")));

		if (request.getParameter("prezzoMin") != null && !request.getParameter("prezzoMin").isEmpty())
			searchImmobile.setPrezzoMin(Long.parseLong(request.getParameter("prezzoMin")));

		if (request.getParameter("prezzoMax") != null && !request.getParameter("prezzoMax").isEmpty())
			searchImmobile.setPrezzoMax(Long.parseLong(request.getParameter("prezzoMax")));

		if (request.getParameter("superficieMin") != null && !request.getParameter("superficieMin").isEmpty())
			searchImmobile.setSuperficieMin(Integer.parseInt(request.getParameter("superficieMin")));

		if (request.getParameter("superficieMax") != null && !request.getParameter("superficieMax").isEmpty())
			searchImmobile.setSuperficieMax(Integer.parseInt(request.getParameter("superficieMax")));

		List<Immobile> listaImmobili = immobileRepository.search(searchImmobile);
		System.out.println("LISTAIMMOBILI" + listaImmobili);
		
		System.out.println("------------" + listaImmobili);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.registerModule(new JavaTimeModule());
		String json = objectMapper.writeValueAsString(listaImmobili);
		System.out.println(json);
		response.getOutputStream().print(json);
	}
}