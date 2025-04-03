package org.generationitaly.casanova.persistence.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/*-
 * CREATE TABLE IF NOT EXISTS `CasaNova`.`Provincia` (
  `idProvincia` INT NOT NULL AUTO_INCREMENT,
  `nome_provincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvincia`)
) ;
 * */
@Entity
@Table(name = "Provincia")
public class Provincia {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_provincia", nullable = false)
	private long idProvincia;

	@Column(name = "nome_provincia", nullable = false)
	private String nomeProvincia;

	public long getIdProvincia() {
		return idProvincia;
	}

	public void setIdProvincia(int idProvincia) {
		this.idProvincia = idProvincia;
	}

	public String getNomeProvincia() {
		return nomeProvincia;
	}

	public void setNomeProvincia(String nomeProvincia) {
		this.nomeProvincia = nomeProvincia;
	}

	@Override
	public String toString() {
		return "Provincia [idProvincia=" + idProvincia + ", nomeProvincia=" + nomeProvincia + "]";
	}

	
}
