package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.Provincia;
import org.generationitaly.casanova.persistence.repository.ProvinciaRepository;

public class ProvinciaRepositoryImpl extends JpaRepositoryImpl<Provincia, Long> implements ProvinciaRepository{

	private static ProvinciaRepositoryImpl instance;
	
	ProvinciaRepositoryImpl() {
		super(Provincia.class);
		// TODO Auto-generated constructor stub
	}

	public static ProvinciaRepositoryImpl getInstance() {
		if (instance == null)
			instance = new ProvinciaRepositoryImpl();
		return instance;
	}
}
