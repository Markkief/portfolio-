package org.generationitaly.casanova.persistence.dto;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Comune;
import org.generationitaly.casanova.persistence.entity.MediazioneImmobile;
import org.generationitaly.casanova.persistence.entity.Provincia;
import org.generationitaly.casanova.persistence.entity.StatoImmobile;
import org.generationitaly.casanova.persistence.entity.TipologiaImmobile;

/**
 * Maps data from various sources as single POJO.
 * This is meant to be used to load data as static during the insertion process of a listing
 * 
 * @author Redi Levendi
 * @version 0.1
 */
public class StaticDataDTO {
    private List<Provincia> prov;
    private List<Comune> comune;
    private List<StatoImmobile> statoImm;
    private List<TipologiaImmobile> tipoImm;
    private List<MediazioneImmobile> mediaImm;

    Provincia dynProv;
    Comune dynCom;
    StatoImmobile dynStato;
    MediazioneImmobile dynMediazioneImmobile;
    TipologiaImmobile dynTipo;

    public StaticDataDTO() {}

    public StaticDataDTO(List<Provincia> prov, List<Comune> comune, List<StatoImmobile> statoImm,
            List<TipologiaImmobile> tipoImm) {
        this.prov = prov;
        this.comune = comune;
        this.statoImm = statoImm;
        this.tipoImm = tipoImm;
    }

    public void setDynamicData(Provincia dynProv, Comune dynCom, StatoImmobile dynStato, MediazioneImmobile dynMediazioneImmobile, TipologiaImmobile dynTipo) {
        this.dynCom = dynCom;
        this.dynProv = dynProv;
        this.dynStato = dynStato;
        this.dynMediazioneImmobile = dynMediazioneImmobile;
        this.dynTipo = dynTipo;

    }
    public List<Provincia> getProv() {
        return prov;
    }
    public void setProv(List<Provincia> prov) {
        this.prov = prov;
    }
    public List<Comune> getComune() {
        return comune;
    }
    public void setComune(List<Comune> comune) {
        this.comune = comune;
    }
    public List<StatoImmobile> getStatoImm() {
        return statoImm;
    }
    public void setStatoImm(List<StatoImmobile> statoImm) {
        this.statoImm = statoImm;
    }
    public List<TipologiaImmobile> getTipoImm() {
        return tipoImm;
    }
    public void setTipoImm(List<TipologiaImmobile> tipoImm) {
        this.tipoImm = tipoImm;
    }

	public List<MediazioneImmobile> getMediaImm() {
		return mediaImm;
	}

	public void setMediaImm(List<MediazioneImmobile> mediaImm) {
		this.mediaImm = mediaImm;
	}

	public Provincia getDynProv() {
		return dynProv;
	}

	public void setDynProv(Provincia dynProv) {
		this.dynProv = dynProv;
	}

	public Comune getDynCom() {
		return dynCom;
	}

	public void setDynCom(Comune dynCom) {
		this.dynCom = dynCom;
	}

	public StatoImmobile getDynStato() {
		return dynStato;
	}

	public void setDynStato(StatoImmobile dynStato) {
		this.dynStato = dynStato;
	}

	public MediazioneImmobile getDynMediazioneImmobile() {
		return dynMediazioneImmobile;
	}

	public void setDynMediazioneImmobile(MediazioneImmobile dynMediazioneImmobile) {
		this.dynMediazioneImmobile = dynMediazioneImmobile;
	}

	public TipologiaImmobile getDynTipo() {
		return dynTipo;
	}

	public void setDynTipo(TipologiaImmobile dynTipo) {
		this.dynTipo = dynTipo;
	}
    

    

}
