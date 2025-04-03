package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Immobile")
public class Immobile {
	/*
CREATE TABLE IF NOT EXISTS `CasaNova`.`Immobile` (
  `id_immobile` INT NOT NULL AUTO_INCREMENT,
  `id_comune` INT NOT NULL,
  `id_provincia` INT NOT NULL,
  `id_tipologia_immobile` INT NOT NULL,
  `superficie` VARCHAR(45) NULL,
  `indirizzo` VARCHAR(45) NULL,
  `locali` INT NULL,
  `ascensore` TINYINT NULL,
  `terrazzo` INT NULL,
  `piano` INT NULL,  
  `balcone` INT NULL,
  `giardino` TINYINT NULL,
  `garage`TINYINT NULL,
  `bagno` INT NULL,
  PRIMARY KEY (`id_immobile`),
  FOREIGN KEY (`id_comune`) REFERENCES `CasaNova`.`Comune` (`id_comune`),
  CHECK(`ascensore` IN (0,1)),
  CHECK(`giardino` IN (0,1)),
  CHECK(`garage` IN (0,1))
);

	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_immobile", nullable = false)
	private long id;
	
	@Column(name = "superficie", unique = false, nullable = true)
	private int superficie;
	
	@ManyToOne
	@JoinColumn(name="id_provincia", nullable = false)
	private Provincia provincia;
	
	@Column(name = "indirizzo", unique = true, nullable = true, length = 45)
	private String indirizzo;
	
	@Column(name = "locali", unique = false, nullable = true)
	private int locali;
	
	@Column(name = "ascensore", unique = false, nullable = true)
	private boolean ascensore;
	
	@Column(name = "terrazzo", unique = false, nullable = true)
	private int terrazzo;
	
	@Column(name = "giardino", unique = false, nullable = true)
	private int giardino;
	
	@Column(name = "garage", unique = false, nullable = true)
	private boolean garage;
	
	@Column(name = "bagno", unique = false, nullable = true)
	private int bagno;
	
	@Column(name = "balcone", unique = false, nullable = true)
	private int balcone;
	
	@Column(name = "piano", unique = false, nullable = true)
	private int piano;
	@ManyToOne
	@JoinColumn(name="id_comune", nullable= false )
	private Comune comune;
	@ManyToOne
	@JoinColumn(name="id_tipologia_immobile", nullable= false )
	private TipologiaImmobile tipologiaImmobile;
	
    @OneToOne(mappedBy = "building")
    private Listing listing;
	
	public Immobile(Provincia provincia, Comune comune, TipologiaImmobile tipologiaImmobile) {
		super();
		this.provincia = provincia;
		this.comune = comune;
		this.tipologiaImmobile = tipologiaImmobile;
	}
	
	public Immobile(long id, int superficie, Provincia provincia, String indirizzo, int locali, boolean ascensore,
			int terrazzo, int giardino, boolean garage, int bagno, int balcone, int piano, Comune comune,
			TipologiaImmobile tipologiaImmobile) {
		super();
		this.id = id;
		this.superficie = superficie;
		this.provincia = provincia;
		this.indirizzo = indirizzo;
		this.locali = locali;
		this.ascensore = ascensore;
		this.terrazzo = terrazzo;
		this.giardino = giardino;
		this.garage = garage;
		this.bagno = bagno;
		this.balcone = balcone;
		this.piano = piano;
		this.comune = comune;
		this.tipologiaImmobile = tipologiaImmobile;
	}

	public Immobile() {}


	public long getId() {
		return id;
	}
	

	public int getPiano() {
		return piano;
	}


	
	public int getBalcone() {
		return balcone;
	}


	public void setBalcone(int balcone) {
		this.balcone = balcone;
	}


	public void setPiano(int piano) {
		this.piano = piano;
	}


	public TipologiaImmobile getTipologiaImmobile() {
		return tipologiaImmobile;
	}


	public void setTipologiaImmobile(TipologiaImmobile tipologiaImmobile) {
		this.tipologiaImmobile = tipologiaImmobile;
	}


	public void setId(long id) {
		this.id = id;
	}

	public int getSuperficie() {
		return superficie;
	}

	public void setSuperficie(int superficie) {
		this.superficie = superficie;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public int getLocali() {
		return locali;
	}

	public void setLocali(int locali) {
		this.locali = locali;
	}

	public boolean isAscensore() {
		return ascensore;
	}

	public void setAscensore(boolean ascensore) {
		this.ascensore = ascensore;
	}

	public int getTerrazzo() {
		return terrazzo;
	}

	public void setTerrazzo(int terrazzo) {
		this.terrazzo = terrazzo;
	}

	public int isGiardino() {
		return giardino;
	}

	public void setGiardino(int giardino) {
		this.giardino = giardino;
	}

	public boolean isGarage() {
		return garage;
	}

	public void setGarage(boolean garage) {
		this.garage = garage;
	}

	public int getBagno() {
		return bagno;
	}

	public void setBagno(int bagno) {
		this.bagno = bagno;
	}

	public Comune getComune() {
		return comune;
	}

	public void setComune(Comune comune) {
		this.comune = comune;
	}

	public Listing getListing() {
		return listing;
	}

	public void setListing(Listing listing) {
		this.listing = listing;
	}

	public int getGiardino() {
		return giardino;
	}

	@Override
	public String toString() {
		return "Immobile [id=" + id + ", superficie=" + superficie + ", provincia=" + provincia + ", indirizzo="
				+ indirizzo + ", locali=" + locali + ", ascensore=" + ascensore + ", terrazzo=" + terrazzo
				+ ", giardino=" + giardino + ", garage=" + garage + ", bagno=" + bagno + ", balcone=" + balcone
				+ ", piano=" + piano + ", comune=" + comune + ", tipologiaImmobile=" + tipologiaImmobile + "]";
	}
	
}