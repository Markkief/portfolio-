package org.generationitaly.casanova.persistence.repositoryImpl;


import org.generationitaly.casanova.persistence.entity.Comune;
import org.generationitaly.casanova.persistence.repository.ComuneRepository;

public class ComuneRepositoryImpl extends JpaRepositoryImpl<Comune, Long> implements ComuneRepository{

	private static ComuneRepositoryImpl instance;
	
	ComuneRepositoryImpl() {
		super(Comune.class);
		// TODO Auto-generated constructor stub
	}
	
	public static ComuneRepositoryImpl getInstance() {
		if (instance == null)
			instance = new ComuneRepositoryImpl();
		return instance;
	}


}
