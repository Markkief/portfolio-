package org.generationitaly.casanova.services;

import org.generationitaly.casanova.persistence.dto.AdminProfileDTO;
import org.generationitaly.casanova.persistence.entity.RoleApplication;
import org.generationitaly.casanova.persistence.repository.ListingRepository;
import org.generationitaly.casanova.persistence.repository.RoleApplicationRepository;
import org.generationitaly.casanova.persistence.repositoryImpl.ListingRepositoryImpl;
import org.generationitaly.casanova.persistence.repositoryImpl.RoleApplicationRepositoryImpl;
/**
 * This service class is meant to populate the AdminProfileDTO
 * needed by the /admin/profile servlet
 * 
 * @author Redi Levendi
 * @version 0.0.1 Blank Class
 */
public class AdminProfileService {
    AdminProfileDTO profile;
    ListingRepository lstRepo;
    RoleApplicationRepository roleRepo;

    public AdminProfileService() {
        lstRepo = ListingRepositoryImpl.getInstance();
        roleRepo = RoleApplicationRepositoryImpl.getInstance();

        profile = new AdminProfileDTO(
            roleRepo.findPending(),
            lstRepo.findAllByPending(),
            roleRepo.findRejected()
        );
    }

    public AdminProfileDTO getProfile() {
        return profile;
    }
}
