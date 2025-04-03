package org.generationitaly.casanova.persistence.entity;

import org.hibernate.annotations.ForeignKey;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/*-
 * CREATE TABLE IF NOT EXISTS `CasaNova`.`Comune` (
  `id_comune` INT NOT NULL AUTO_INCREMENT,
  `id_provincia` INT NOT NULL,
  `nome_comune` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_comune`),
  FOREIGN KEY (`id_provincia`) REFERENCES `CasaNova`.`Provincia` (`idProvincia`)
) ;
 * 
 * */

@Entity
@Table(name = "Comune")
public class Comune {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_comune", nullable = false)
	private long idComune;

	@ManyToOne
	@JoinColumn(name = "id_provincia", nullable = false)
	private Provincia provincia;

	@Column(name = "nome_comune")
	private String nomeComune;

	public long getIdComune() {
		return idComune;
	}

	public void setIdComune(long idComune) {
		this.idComune = idComune;
	}

	public Provincia getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}

	public String getNomeComune() {
		return nomeComune;
	}

	public void setNomeComune(String nomeComune) {
		this.nomeComune = nomeComune;
	}

	@Override
	public String toString() {
		return "Comune [idComune=" + idComune + ", provincia=" + provincia + ", nomeComune=" + nomeComune + "]";
	}

	
}
