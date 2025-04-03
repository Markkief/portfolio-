package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.dto.RevisorProfileDTO;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.PendingRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.PendingRepositoryImpl;

/**
 * This service is meant to populate the RevisorProfileDTO
 * needed by the /revisor/profile servlet
 * 
 * @author Redi Levendi
 * @version 0.0.1 Blank Class
 */
public class RevisorProfileService {
	RevisorProfileDTO profile;
	ListingRepository repo;

	public RevisorProfileService() {
		repo = ListingRepositoryImpl.getInstance();
		profile = new RevisorProfileDTO(
				repo.findAllByPending());
	}

	public RevisorProfileDTO getProfile() {
		return profile;
	}
}
