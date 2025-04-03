package org.generationitaly.casanova.persistence.dto;

import java.util.List;

import org.generationitaly.casanova.persistence.entity.Immobile;
import org.generationitaly.casanova.persistence.entity.Listing;

public class ImmLisDTO {
 
	List<Immobile> imm = null;
	List<Listing>  listing = null;
	
	
	//da spostare in DTO  aparte
	Immobile im = null;
	Listing li = null;
	
	public List<Immobile> getImm() {
		return imm;
	}
	public void setImm(List<Immobile> imm) {
		this.imm = imm;
	}
	public List<Listing> getListing() {
		return listing;
	}
	public void setListing(List<Listing> listing) {
		this.listing = listing;
	}
	//da spostare in DTO  paarte
	public Immobile getIm() {
		return im;
	}
	public void setIm(Immobile im) {
		this.im = im;
	}
	public Listing getLi() {
		return li;
	}
	public void setLi(Listing li) {
		this.li = li;
	}
	
	
}
