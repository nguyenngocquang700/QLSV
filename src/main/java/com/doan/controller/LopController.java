package com.doan.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.crypto.GenerateKeys;
import com.doan.crypto.Hash;
import com.doan.crypto.RSA;
import com.doan.entity.Lop;
import com.doan.entity.Nhanvien;

@Transactional
@Controller
public class LopController {
	@Autowired
	SessionFactory factory;
	
	//===========================================LIST LOP=======================================
	@RequestMapping("/admin/list-lop")
	public String listLopPage(ModelMap model) {
		Session session = factory.openSession();
		try {
			String hql = "FROM Lop";
			Query query = session.createQuery(hql);
			List<Lop> list = query.list();
			System.out.print(list);
			model.addAttribute("lop", list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		} finally {
			session.close();
		}

		return "admin/list-lop";
	}
	
	//=========================================NEW LOP=========================================
	
	@RequestMapping(value = "/admin/new-lop", method = RequestMethod.GET)
	public String newLopPage(ModelMap model) {
		model.addAttribute("lop", new Lop());
		return "admin/new-lop";
	}
	
	@RequestMapping(value = "/admin/new-lop", method = RequestMethod.POST)
	public String newLop(RedirectAttributes re, ModelMap model, @ModelAttribute("lop") Lop lop) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			System.out.println(lop.getMalop() + " " + lop.getTenlop() + " " + lop.getNhanvien().getManv());
			session.save(lop);
			t.commit();
			re.addFlashAttribute("success", "Thêm lớp thành công!");
//			model.addAttribute("message", "Thêm mới Sinh viên thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			re.addFlashAttribute("error", "Không thể thêm lớp này!");
		} finally {
			session.close();
		}
		return "redirect:new-lop";
	}
	
	@ModelAttribute("listNV")
	public List<Nhanvien> getNV() {
		Session session;
		try {
			session = factory.getCurrentSession();
		} catch (HibernateException e) {
			// TODO: handle exception
			session = factory.openSession();
		}
		String hql = "SELECT manv FROM Nhanvien";
		Query<Nhanvien> query = session.createQuery(hql);
		List<Nhanvien> list = query.list();
		System.out.println(list);
		return list;
	}
	
	//==================================UPDATE NHAN VIEN===========================================
	
	@ModelAttribute("update-lop")
	public Lop getLop2Update() {
		return new Lop();  
	}
	
	@RequestMapping(value = "/admin/update-lop", method = RequestMethod.POST)
	public String updateLop(RedirectAttributes re, ModelMap model, @ModelAttribute("update-lop") Lop lop) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			System.out.println(lop.getMalop() + " " + lop.getTenlop() + " " + lop.getNhanvien().getManv());
			session.update(lop);
			t.commit();
			re.addFlashAttribute("success", "Chỉnh sửa lớp thành công!");
//			model.addAttribute("message", "Thêm mới Sinh viên thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			re.addFlashAttribute("error", "Không thể chỉnh sửa lớp này!");
		} finally {
			session.close();
		}
		return "redirect:list-lop";
	}
	
	//================================DELETE LOP=======================================
	
	@ModelAttribute("delete-lop")
	public Lop getLop2del() {
		return new Lop();  
	}
	
	@RequestMapping(value = "admin/delete-lop", method = RequestMethod.POST)
	public String DeleteNhanVien(ModelMap model, @RequestParam("malop") String malop) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Lop lop = (Lop) session.get(Lop.class, malop);
			System.out.println(lop);
			session.delete(lop);
			t.commit();
			model.addAttribute("success", "Xoá Lớp thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("error", "Xoá Lớp thất bại! Bạn phải xoá Sinh Viên trước!");
		} finally {
			session.close();
		}
		session = factory.openSession();
		String hql = "FROM Lop";
		Query query = session.createQuery(hql);
		List<Lop> list = query.list();
		model.addAttribute("lop", list);
		return "admin/list-lop"; 
	}
}
