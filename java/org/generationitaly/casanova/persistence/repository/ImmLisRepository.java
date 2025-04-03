package org.generationitaly.casanova.persistence.repository;

import java.util.List;

import org.generationitaly.casanova.persistence.dto.ImmLisDTO;

public interface ImmLisRepository {

	List<ImmLisDTO> findAll();
	
	void update(ImmLisDTO ImmLis);
}
