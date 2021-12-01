package com.doan.controller;

import java.util.List;
import java.nio.charset.StandardCharsets;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.doan.entity.Lop;
import com.doan.entity.Nhanvien;
import com.doan.entity.Sinhvien;

import com.doan.crypto.*;
import java.security.PrivateKey;
import java.security.PublicKey;

@Transactional
@Controller
public class NhanVienController {
	@Autowired
	SessionFactory factory;

//	@Autowired
//	ServletContext context;

	// =================================LIST NHAN VIEN==============================

	@RequestMapping("/admin/list-nhanvien")
	public String listSVPage(ModelMap model) {
		Session session = factory.openSession();
		try {
			String hql = "FROM Nhanvien";
			Query query = session.createQuery(hql);
			List<Nhanvien> list = query.list();
			System.out.print(list);
			model.addAttribute("nhanvien", list);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		} finally {
			session.close();
		}

		return "admin/list-nhanvien";
	}

	// ==============================NEW NHAN VIEN==================================

	@RequestMapping(value = "/admin/new-nhanvien", method = RequestMethod.GET)
	public String newNVPage(ModelMap model) {
		model.addAttribute("nhanvien", new Nhanvien());
		return "admin/new-nhanvien";
	}

	@RequestMapping(value = "/admin/new-nhanvien", method = RequestMethod.POST)
	public String newNV(ModelMap model, /* @ModelAttribute("nhanvien") Nhanvien nv */@RequestParam("manv") String manv,
			@RequestParam("hoten") String hoten, @RequestParam("email") String email,
			@RequestParam("luong") String luong, @RequestParam("tendn") String tendn,
			@RequestParam("matkhau") String matkhau/*, @RequestParam("matkhau2") String mk2*/) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			new GenerateKeys(GenerateKeys.KEY_1024, manv).gernerateKeysToFile();
			Nhanvien nv = new Nhanvien();
			System.out.println(nv);
			nv.setManv(manv);
			nv.setHoten(hoten);
			nv.setEmail(email);
			nv.setTendn(tendn);
			nv.setPubkey(nv.getManv());
			nv.setLuong(RSA.encryptRSA(luong, manv, GenerateKeys.KEY_1024));
			nv.setMatkhau(Hash.convertSHA1(matkhau));
			System.out.println(nv);
			session.save(nv);
			t.commit();
			model.addAttribute("message", "Thêm mới Nhân viên thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("message", "Thêm mới Nhân viên thất bại !");
		} finally {
			session.close();
		}
		return "admin/new-nhanvien";
	}
	
	//================================UPDATE NHAN VIEN=====================================
	@RequestMapping(value = "/admin/update-nhanvien", method = RequestMethod.POST)
	public String updateNV(ModelMap model, /* @ModelAttribute("nhanvien") Nhanvien nv */@RequestParam("manv") String manv,
			@RequestParam("hoten") String hoten, @RequestParam("email") String email,
			@RequestParam("luong") String luong, @RequestParam("tendn") String tendn,
			@RequestParam("matkhau") String matkhau/*, @RequestParam("matkhau2") String mk2*/) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Nhanvien nv = (Nhanvien) session.get(Nhanvien.class, manv);
		try {
			new GenerateKeys(GenerateKeys.KEY_1024, manv).gernerateKeysToFile();
//			Nhanvien nv = new Nhanvien();
			System.out.println(nv);
//			nv.setManv(manv);
			nv.setHoten(hoten);
			nv.setEmail(email);
			nv.setTendn(tendn);
			nv.setPubkey(manv);
			nv.setLuong(RSA.encryptRSA(luong, manv, GenerateKeys.KEY_1024));
			nv.setMatkhau(Hash.convertSHA1(matkhau));
			System.out.println(nv);
			session.update(nv);
			t.commit();
			model.addAttribute("message", "Chỉnh sửa Nhân viên thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			model.addAttribute("message", "Chỉnh sửa Nhân viên thất bại !");
		} finally {
			session.close();
		}
		return "admin/list-nhanvien";
	}
	
	//================================DELETE NHAN VIEN=======================================
	
	@ModelAttribute("delete-nhanvien")
	public Nhanvien getNhanvien2del() {
		return new Nhanvien();  
	}
	
	@RequestMapping(value = "admin/del-nhanvien", method = RequestMethod.POST)
	public String DeleteNhanVien(ModelMap model,
			@ModelAttribute("delete-nhanvien") Nhanvien nv) {
		Session session = factory.getCurrentSession();
		Transaction t = session.beginTransaction();
		try {
			session.delete(nv);
			t.commit();
			model.addAttribute("message", "Xoá Nhân Viên thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xoá Nhân Viên thất bại! Nhân viên đang quản lý lớp học!");
		} finally {
			session.close();
		}
		session = factory.openSession();
		String hql = "FROM Nhanvien";
		Query query = session.createQuery(hql);
		List<Nhanvien> list = query.list();
		model.addAttribute("nhanvien", list);
		return "redirect:list-nhanvien"; 
	}
	//===================================MODEL LIST======================================
	
}
