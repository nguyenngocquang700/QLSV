package com.doan.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the BANGDIEM database table.
 * 
 */
@Entity
@Table(name="BANGDIEM")
@NamedQuery(name="Bangdiem.findAll", query="SELECT b FROM Bangdiem b")
public class Bangdiem implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private BangdiemPK id;

	@Column(name="DIEMTHI")
	private byte[] diemthi;

	//bi-directional many-to-one association to Hocphan
	@ManyToOne
	@JoinColumn(name="MAHP",insertable = false, updatable =false)
	private Hocphan hocphan;

	//bi-directional many-to-one association to Sinhvien
	@ManyToOne
	@JoinColumn(name="MASV",insertable = false, updatable =false)
	private Sinhvien sinhvien;

	public Bangdiem() {
	}

	public Bangdiem(BangdiemPK id, byte[] diemthi, Hocphan hocphan, Sinhvien sinhvien) {
		super();
		this.id = id;
		this.diemthi = diemthi;
		this.hocphan = hocphan;
		this.sinhvien = sinhvien;
	}

	public BangdiemPK getId() {
		return this.id;
	}

	public void setId(BangdiemPK id) {
		this.id = id;
	}

	public byte[] getDiemthi() {
		return this.diemthi;
	}

	public void setDiemthi(byte[] diemthi) {
		this.diemthi = diemthi;
	}

	public Hocphan getHocphan() {
		return this.hocphan;
	}

	public void setHocphan(Hocphan hocphan) {
		this.hocphan = hocphan;
	}

	public Sinhvien getSinhvien() {
		return this.sinhvien;
	}

	public void setSinhvien(Sinhvien sinhvien) {
		this.sinhvien = sinhvien;
	}

}