package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the HOCPHAN database table.
 * 
 */
@Entity
@Table(name="HOCPHAN")
@NamedQuery(name="Hocphan.findAll", query="SELECT h FROM Hocphan h")
public class Hocphan implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MAHP")
	private String mahp;

	@Column(name="SOTC")
	private int sotc;

	@Column(name="TENHP")
	private String tenhp;

	//bi-directional many-to-one association to Bangdiem
	@OneToMany(mappedBy="hocphan")
	private List<Bangdiem> bangdiems;

	public Hocphan() {
	}

	public Hocphan(String mahp, int sotc, String tenhp, List<Bangdiem> bangdiems) {
		super();
		this.mahp = mahp;
		this.sotc = sotc;
		this.tenhp = tenhp;
		this.bangdiems = bangdiems;
	}

	public String getMahp() {
		return this.mahp;
	}

	public void setMahp(String mahp) {
		this.mahp = mahp;
	}

	public int getSotc() {
		return this.sotc;
	}

	public void setSotc(int sotc) {
		this.sotc = sotc;
	}

	public String getTenhp() {
		return this.tenhp;
	}

	public void setTenhp(String tenhp) {
		this.tenhp = tenhp;
	}

	public List<Bangdiem> getBangdiems() {
		return this.bangdiems;
	}

	public void setBangdiems(List<Bangdiem> bangdiems) {
		this.bangdiems = bangdiems;
	}

	public Bangdiem addBangdiem(Bangdiem bangdiem) {
		getBangdiems().add(bangdiem);
		bangdiem.setHocphan(this);

		return bangdiem;
	}

	public Bangdiem removeBangdiem(Bangdiem bangdiem) {
		getBangdiems().remove(bangdiem);
		bangdiem.setHocphan(null);

		return bangdiem;
	}

}