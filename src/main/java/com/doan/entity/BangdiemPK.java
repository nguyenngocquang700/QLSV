package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the BANGDIEM database table.
 * 
 */
@Embeddable
public class BangdiemPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(name="MASV", insertable=false, updatable=false)
	private String masv;

	@Column(name="MAHP", insertable=false, updatable=false)
	private String mahp;

	public BangdiemPK() {
	}
	public String getMasv() {
		return this.masv;
	}
	public void setMasv(String masv) {
		this.masv = masv;
	}
	public String getMahp() {
		return this.mahp;
	}
	public void setMahp(String mahp) {
		this.mahp = mahp;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof BangdiemPK)) {
			return false;
		}
		BangdiemPK castOther = (BangdiemPK)other;
		return 
			this.masv.equals(castOther.masv)
			&& this.mahp.equals(castOther.mahp);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.masv.hashCode();
		hash = hash * prime + this.mahp.hashCode();
		
		return hash;
	}
}