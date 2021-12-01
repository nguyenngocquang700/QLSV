package com.doan.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doan.crypto.Hash;
import com.doan.entity.Bangdiem;
import com.doan.entity.Hocphan;

@Transactional
@Controller
public class BangDiemController {
	@Autowired
	SessionFactory factory;
	
//	@Autowired
//	ServletContext context;
	
	@RequestMapping("/admin/list-bangdiem")
	public String listBDPage(ModelMap model) {
		Session session = factory.openSession();
		try {
			String hql = "FROM Bangdiem";
			Query query = session.createQuery(hql);
			List<Bangdiem> list = query.list();
			System.out.print(list);
			model.addAttribute("bangdiem", list);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		} finally {
			session.close();
		}

		return "admin/list-bangdiem";
	}
	//=============================UPDATE DIEM===================================
	@RequestMapping(value = "/admin/update-diem", method = RequestMethod.POST)
	public String updateDiem(RedirectAttributes re, ModelMap model, @RequestParam("masv") String masv,
			@RequestParam("hoten") String hoten, @RequestParam("mahp") String mahp, 
			@RequestParam("tenhp") String tenhp, @RequestParam("diemthi") String diemthi) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		Bangdiem bd = (Bangdiem) session.get(Bangdiem.class, masv);
		try {
			bd.setDiemthi(Hash.convertSHA1(diemthi));
			session.update(bd);
			t.commit();
			re.addFlashAttribute("success", "Chỉnh sửa điểm thành công !");
		} catch (Exception e) {
			e.printStackTrace();
			t.rollback();
			re.addFlashAttribute("error", "Chỉnh sửa điểm thất bại !");
		} finally {
			session.close();
		}
		return "redirect:list-bangdiem";
	}
}
