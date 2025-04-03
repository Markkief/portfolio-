package org.generationitaly.casanova.controller;

import java.io.IOException;
import java.util.Map;

import org.generationitaly.casanova.enums.ListingStatus;
import org.generationitaly.casanova.persistence.dto.StaticDataDTO;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.ImmagineImmobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.User;
import org.generationitaly.casanova.records.DynamicInput;
import org.generationitaly.casanova.services.InsertService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet that manages the insertion of a new listing. 
 * Expects the data from the frontend with the correct classes set as attributes
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */
@WebServlet("/addimmobile")
public class InsertListingServlet extends HttpServlet {
    InsertService insService;
    StaticDataDTO data;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        insService = new InsertService();
        data = insService.loadInsertData();

        Map<String, Object> attributes = Map.of(
            "provincie", data.getProv(),
            "statiImmobile", data.getStatoImm(),
            "comuni", data.getComune(),
            "mediazioni", data.getMediaImm(),
            "tipologie", data.getTipoImm()
        );

        attributes.forEach(request::setAttribute);
        request.getRequestDispatcher("insert-announcement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        System.out.println(session.getAttribute("user"));
        
        insService = new InsertService();
        data = insService.loadDynamicData(data, new DynamicInput(
            Long.parseLong(request.getParameter("idProvincia")), 
            Long.parseLong(request.getParameter("idComune")), 
            Long.parseLong(request.getParameter("idStatoImmobile")), 
            Long.parseLong(request.getParameter("idMediazioneImmobile")), 
            Long.parseLong(request.getParameter("idTipologiaImmobile")))
            );

        Immobile imm = loadImm(new Immobile(), data, request);
        Listing lst = loadListing(new Listing(), imm, (User) session.getAttribute("user"), data, request);
        System.out.println(imm.toString());
        System.out.println(lst);
        insService.setImmobile(imm);
        insService.setListing(lst);
        insService.persist();
        response.sendRedirect("get-listing?id="+lst.getListing_id());
    }

    private Immobile loadImm(Immobile imm, StaticDataDTO data, HttpServletRequest req) {
        imm.setIndirizzo(req.getParameter("indirizzo"));
        imm.setSuperficie(Integer.parseInt(req.getParameter("superficie")));
        imm.setLocali(Integer.parseInt(req.getParameter("locali")));
        imm.setBagno(Integer.parseInt(req.getParameter("bagno")));
        imm.setPiano(Integer.parseInt(req.getParameter("piano")));
        imm.setAscensore(Boolean.parseBoolean(req.getParameter("ascensore")));
        imm.setTerrazzo(Integer.parseInt(req.getParameter("terrazzo")));
        imm.setBalcone(Integer.parseInt(req.getParameter("balcone")));
        imm.setGiardino(Integer.parseInt(req.getParameter("giardino")));
        imm.setGarage(Boolean.parseBoolean(req.getParameter("garage")));
        imm.setComune(data.getDynCom());
        imm.setTipologiaImmobile(data.getDynTipo());
        imm.setProvincia(data.getDynProv());        
        
        return imm;
    }

    private Listing loadListing(Listing lst, Immobile imm, User user, StaticDataDTO data, HttpServletRequest req) {
       // remember to get user
        lst.setTitle(req.getParameter("title"));
        lst.setPrezzo( Long.parseLong(req.getParameter("prezzo")));
        lst.setDescrizione(req.getParameter("descrizione"));
        lst.setStatus(ListingStatus.PENDING);
        // set Immobile here
        lst.setBuilding(imm);
        lst.setUser(user);
        lst.setStatoImmobile(data.getDynStato());
        lst.setMediazioneImmobile(data.getDynMediazioneImmobile());
        ImmagineImmobile imgimm = new ImmagineImmobile();
        lst.setImmagineImmobile(imgimm);
        imgimm.setImg(req.getParameter("img"));
        

        return lst;
    }

}
