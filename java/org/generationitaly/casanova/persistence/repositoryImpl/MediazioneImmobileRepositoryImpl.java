package org.generationitaly.casanova.persistence.repositoryImpl;

import org.generationitaly.casanova.persistence.entity.MediazioneImmobile;
import org.generationitaly.casanova.persistence.repository.MediazioneImmobileRepository;

public class MediazioneImmobileRepositoryImpl extends JpaRepositoryImpl<MediazioneImmobile, Long> implements MediazioneImmobileRepository{

	private static MediazioneImmobileRepositoryImpl instance;
	
	MediazioneImmobileRepositoryImpl() {
		super(MediazioneImmobile.class);
		// TODO Auto-generated constructor stub
	}

	public static MediazioneImmobileRepositoryImpl getInstance() {
		if (instance == null)
			instance = new MediazioneImmobileRepositoryImpl();
		return instance;
	}
}
