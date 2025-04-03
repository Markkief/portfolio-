package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/*
 CREATE TABLE Preferiti(
id_preferiti INT NOT NULL,
id_listing INT NOT NULL,
id_utente INT NOT NULL,
 PRIMARY KEY (`id_preferiti`),
FOREIGN KEY (`id_utente`) REFERENCES `CasaNova`.`User` (`user_id`),
FOREIGN KEY (`id_listing`) REFERENCES `CasaNova`.`Listing` (`id_listing`)
);
*/
@Entity
@Table(name = "Preferiti")
public class Favourite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	long id_preferiti;
	
	@ManyToOne
	@JoinColumn(name="id_listing", nullable= false )
	Listing id_listing;
	@ManyToOne
	@JoinColumn(name="id_utente", nullable= false )
	User id_utente;
	public long getId_preferiti() {
		return id_preferiti;
	}
	public Listing getListing() {
		return id_listing;
	}
	public User getId_utente() {
		return id_utente;
	}

	public void setListing(Listing listing) {
		this.id_listing = listing;
	}

	public void setId_utente(User user) {
		this.id_utente = user;
	}
}
