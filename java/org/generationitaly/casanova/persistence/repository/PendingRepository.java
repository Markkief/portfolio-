package org.generationitaly.casanova.persistence.repository;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Listing;

public interface PendingRepository extends JpaRepository<Listing, Long> {
	List<Listing> findAllByPending();
}
