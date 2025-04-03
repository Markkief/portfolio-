package org.generationitaly.casanova.persistence.repository;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.SearchImmobileDTO;

public interface ImmobileRepository extends JpaRepository<Immobile, Long>{

	List<Immobile> search(SearchImmobileDTO SearchDTO);
}
