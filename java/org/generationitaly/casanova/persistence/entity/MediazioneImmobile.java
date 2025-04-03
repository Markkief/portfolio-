package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "MediazioneImmobile")
public class MediazioneImmobile {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_mediazione_immobile", nullable = false)
	private long idMediazione;
	@Column(name = "mediazione", unique = false, nullable = false, length = 45)
	private String mediazione;

	
	public long getIdMediazione() {
		return idMediazione;
	}
	public void setIdMediazione(long idMediazione) {
		this.idMediazione = idMediazione;
	}
	public String getMediazione() {
		return mediazione;
	}
	public void setMediazione(String mediazione) {
		this.mediazione = mediazione;
	}
	@Override
	public String toString() {
		return "MediazioneImmobile [idMediazione=" + idMediazione + ", mediazione=" + mediazione + "]";
	}
	
	

	
}
