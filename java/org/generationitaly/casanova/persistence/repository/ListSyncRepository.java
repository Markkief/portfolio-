package org.generationitaly.casanova.persistence.repository;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;

public interface ListSyncRepository {

	void save(Immobile immobile, Listing listing);
	
}
