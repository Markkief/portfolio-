package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.dto.StaticDataDTO;
import org.generationitaly.casanova.persistence.entity.Comune;
import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;
import org.generationitaly.casanova.persistence.entity.MediazioneImmobile;
import org.generationitaly.casanova.persistence.entity.Provincia;
import org.generationitaly.casanova.persistence.entity.StatoImmobile;
import org.generationitaly.casanova.persistence.entity.TipologiaImmobile;
import org.generationitaly.casanova.persistence.repository.ComuneRepository;
import org.generationitaly.casanova.persistence.repository.ImmobileRepository;
import org.generationitaly.casanova.persistence.repository.ListSyncRepository;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.MediazioneImmobileRepository;
import org.generationitaly.casanova.persistence.repository.ProvinciaRepository;
import org.generationitaly.casanova.persistence.repository.StatoImmobileRepository;
import org.generationitaly.casanova.persistence.repository.TipologiaImmobileRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ComuneRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ListSyncRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.MediazioneImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.PersistenceUtil;
import org.generationitaly.casanova.persistence.repositoryImpl.ProvinciaRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.StatoImmobileRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.TipologiaImmobileRepositoryImpl;
import org.generationitaly.casanova.records.DynamicInput;
import org.hibernate.Session;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;

/**
 * Service layer component used to synchronize Immobile entity and Listing entity while
 * maintaining compatibility of older servlets
 * 
 * @author Redi Levendi
 * @version 0.2 Added transaction
 */
public class InsertService {
	Immobile immobile;
	Listing listing;
    StaticDataDTO data;
	
    ListSyncRepository lsr;
    private ImmobileRepository immobileRepo = ImmobileRepositoryImpl.getInstance();
    private ProvinciaRepository provinciaRepo = ProvinciaRepositoryImpl.getInstance();
    private ComuneRepository comuneRepo = ComuneRepositoryImpl.getInstance();
    private StatoImmobileRepository statoImmobileRepo = StatoImmobileRepositoryImpl.getInstance();
    private MediazioneImmobileRepository mediazioneImmobileRepo = MediazioneImmobileRepositoryImpl.getInstance();
    private TipologiaImmobileRepository tipologiaImmobileRepo = TipologiaImmobileRepositoryImpl.getInstance();

    public InsertService() {
    	data = new StaticDataDTO();
    	 lsr = ListSyncRepositoryImpl.getInstance();
    }

    public InsertService(Immobile immobile, Listing listing) {
        this.listing = listing;
        this.immobile = immobile;
        lsr = ListSyncRepositoryImpl.getInstance();
        data = new StaticDataDTO();
    }

    public void persist() {
    	lsr.save(immobile, listing);
    }

    public StaticDataDTO loadInsertData() {
        data.setProv(provinciaRepo.findAll());
        data.setComune(comuneRepo.findAll());
        data.setStatoImm(statoImmobileRepo.findAll());
        data.setTipoImm(tipologiaImmobileRepo.findAll());
        data.setMediaImm(mediazioneImmobileRepo.findAll());
        return data;
    }

    public StaticDataDTO loadDynamicData(StaticDataDTO data, DynamicInput dynData) {
		data.setDynamicData(
            provinciaRepo.findById(dynData.idProv()),
		    comuneRepo.findById(dynData.idCom()),
		    statoImmobileRepo.findById(dynData.idStato()),
		    mediazioneImmobileRepo.findById(dynData.idMediaz()),
		    tipologiaImmobileRepo.findById(dynData.idTipo())
            );

        return data;
    }

    public void setImmobile(Immobile immobile) {
        this.immobile = immobile;
    }

    public void setListing(Listing listing) {
        this.listing = listing;
    }

    
}
