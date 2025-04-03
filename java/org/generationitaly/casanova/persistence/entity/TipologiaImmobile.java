package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/*-
CREATE TABLE IF NOT EXISTS `CasaNova`.`TipologiaImmobile` (
  `idTipologiaImmobile` INT NOT NULL AUTO_INCREMENT,
  `tipologia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipologiaImmobile`)
);
*/

@Entity
@Table(name = "TipologiaImmobile")
public class TipologiaImmobile {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_tipologia_immobile", nullable = false)
	private long id;

	@Column(name = "tipologia")
	private String tipologia;

	public long getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipologia() {
		return tipologia;
	}

	public void setTipologia(String tipologia) {
		this.tipologia = tipologia;
	}

	@Override
	public String toString() {
		return "TipologiaImmobile [id=" + id + ", tipologia=" + tipologia + "]";
	}

	
}
