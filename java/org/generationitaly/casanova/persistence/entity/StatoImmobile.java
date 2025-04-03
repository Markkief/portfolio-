package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/*-
 * CREATE TABLE IF NOT EXISTS `CasaNova`.`StatoImmobile` (
  `idStatoImmobile` INT NOT NULL AUTO_INCREMENT,
  `stato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStatoImmobile`)
);
 * */
@Entity
@Table(name = "StatoImmobile")
public class StatoImmobile {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_stato_immobile", nullable = false)
	private long idStatoImmobile;

	@Column(name = "stato", nullable = false)
	private String stato;

	public long getIdStatoImmobile() {
		return idStatoImmobile;
	}

	public void setIdStatoImmobile(int idStatoImmobile) {
		this.idStatoImmobile = idStatoImmobile;
	}

	public String getStato() {
		return stato;
	}

	public void setStato(String stato) {
		this.stato = stato;
	}

	@Override
	public String toString() {
		return "StatoImmobile [idStatoImmobile=" + idStatoImmobile + ", stato=" + stato + "]";
	}

	
	
}
