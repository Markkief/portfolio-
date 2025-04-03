package org.generationitaly.casanova.persistence.entity;

import java.time.LocalDateTime;

import org.generationitaly.casanova.enums.ListingStatus;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mysql.cj.x.protobuf.MysqlxCursor.Fetch;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

/**
 * This entity maps the listings with the correct table.
 * This builds upon the Immobile entity and adds other necessary data needed
 * to be shown on the frontend.
 * This entity is meant to be used to get user listings
 * 
 * @author Redi Levendi
 * @version 0.1 Initial Version
 */


/*
 CREATE TABLE Listing (
  id_listing INT AUTO_INCREMENT PRIMARY KEY,
  id_mediazione_immobile INT NOT NULL,
  id_immagine_immobile INT,
  id_stato_immobile INT NOT NULL,
  id_utente INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  prezzo INT NULL,
  descrizione TEXT NULL,
  listing_status ENUM('RENT', 'SELL', 'PENDING') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  id_immobile INT NOT NULL,
   PRIMARY KEY (`id_listing`),
  FOREIGN KEY (`id_mediazione_immobile`) REFERENCES `CasaNova`.`MediazioneImmobile` (`id_mediazione_immobile`),
  FOREIGN KEY (`id_immagine_immobile`) REFERENCES `CasaNova`.`ImmagineImmobile` (`id_immagine_immobile`),
  FOREIGN KEY (`id_stato_immobile`) REFERENCES `CasaNova`.`StatoImmobile` (`id_stato_immobile`),
  FOREIGN KEY (`id_utente`) REFERENCES `CasaNova`.`User` (`user_id`),
  FOREIGN KEY(`id_immobile`) REFERENCES `Immobile` (`id_immobile`)
);
 */
@Entity
@Table(name = "Listing")
public class Listing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id_listing;
    @Column(name = "title", unique = false, nullable = true)
    private String title;
    @Column(name = "prezzo", unique = false, nullable = true)
	private long prezzo;
    @Column(name = "descrizione", unique = false, nullable = true, length = 1000)
	private String descrizione;
    @Column(name = "listing_status")
    @Enumerated(EnumType.STRING)
    private ListingStatus status;
    @JsonIgnore
    @Column(name = "created_at")
    @CreationTimestamp
    private LocalDateTime createdAt;
    @JsonIgnore
    @Column(name = "updated_at")
    @UpdateTimestamp
    private LocalDateTime updatedAt;
    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "id_immobile")
    private Immobile building;
    @ManyToOne
	@JoinColumn(name="id_utente")
	private User user;
    @ManyToOne
	@JoinColumn(name="id_stato_immobile", nullable= false )
	private StatoImmobile statoImmobile;
    @ManyToOne
	@JoinColumn(name="id_mediazione_immobile", nullable= false )
	private MediazioneImmobile mediazioneImmobile;
   
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
 	@JoinColumn(name="id_immagine_immobile", nullable= true)
	private ImmagineImmobile immagineImmobile;
	
    public Listing(User user, StatoImmobile statoImmobile, MediazioneImmobile mediazioneImmobile) {
		super();
		
		this.user = user;
		
		this.statoImmobile = statoImmobile;
		this.mediazioneImmobile = mediazioneImmobile;
	}

    public Listing() {}

	public Listing(ListingStatus status) {
        this.status = status;
    }

    public long getListing_id() {
        return id_listing;
    }

    public String getTitle() {
        return title;
    }

    public ListingStatus getStatus() {
        return status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public Immobile getBuilding() {
        return building;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setStatus(ListingStatus status) {
        this.status = status;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public void setBuilding(Immobile building) {
        this.building = building;
    }

    public long getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(long l) {
        this.prezzo = l;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public StatoImmobile getStatoImmobile() {
        return statoImmobile;
    }

    public void setStatoImmobile(StatoImmobile statoImmobile) {
        this.statoImmobile = statoImmobile;
    }

    public MediazioneImmobile getMediazioneImmobile() {
        return mediazioneImmobile;
    }

    public void setMediazioneImmobile(MediazioneImmobile mediazioneImmobile) {
        this.mediazioneImmobile = mediazioneImmobile;
    }

	public ImmagineImmobile getImmagineImmobile() {
		return immagineImmobile;
	}

	public void setImmagineImmobile(ImmagineImmobile immagineImmobile) {
		this.immagineImmobile = immagineImmobile;
	}

    

}
