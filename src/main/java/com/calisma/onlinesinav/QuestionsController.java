package com.calisma.onlinesinav;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Properties.optionPro;
import Utils.Db;

@Controller
public class QuestionsController {

	Db db = new Db("examapp", "root", "");

	@RequestMapping(value = "/options/{qId}", method = RequestMethod.GET)
	public String option(@PathVariable String qId, Model model) {
		System.out.println("secenek eklenecek olan soru:" + qId);
		
		try {
			String query = "call selectQuestionPro('" + qId + "')";
			ResultSet rs = db.connect().executeQuery(query);
			if (rs.next()) {
				model.addAttribute("question",rs.getString(1));
				model.addAttribute("qId",qId);
				System.out.println("selectQuestionPro successfull");
			}
		} catch (Exception e) {
			System.err.println("selectQuestionPro Exception:" + e);
		}
		
		
		List<optionPro> optionsLs=selectOptions(qId);
		if(optionsLs.size()>0) {
			model.addAttribute("optionsLs",optionsLs);
			System.out.println("list gonderildi");
		}

		return "options";
	}

	@RequestMapping(value = "/questions/{qId}", method = RequestMethod.GET)
	public String deleteQuestion(@PathVariable String qId) {
		System.out.println("silinecek olan soru:" + qId);

		String query = "call deleteQuestionPro('" + qId + "')";
		try {
			int ans = db.connect().executeUpdate(query);
			if (ans > 0) {
				System.out.println("deleteQuestionPro successfull");
			}
		} catch (Exception e) {
			System.err.println("deleteQuestionPro Exception:" + e);
		}
		return "redirect:/questions";
	}

	@RequestMapping(value = "/questionadd", method = RequestMethod.POST)
	public String questionadd(@RequestParam String question) {

		if (!question.trim().equals("")) {
			insertquestion(question);
		}

		return "redirect:/questions";
	}

	public void insertquestion(String question) {
		try {
			PreparedStatement prs = db.preConnect("call insertQuestionPro(?)");
			prs.setString(1, question);
			int ans = prs.executeUpdate();
			if (ans > 0) {
				System.out.println("insertQuestionPro successfull");
			}

		} catch (Exception e) {
			System.err.println("insertQuestionPro Exception:" + e);
		}

	}

	public List<optionPro> selectOptions(String qId) {
		List<optionPro> optionsLs = new ArrayList<optionPro>();
		try {
			String q = "call selectOptionsPro('" + qId + "')";
			ResultSet rs = db.connect().executeQuery(q);
			while (rs.next()) {
				optionPro op = new optionPro();
				op.setoId(rs.getString(1));
				op.setOption(rs.getString(2));
				op.setAnswer(rs.getString(3));
				op.setqId(rs.getString(4));
				op.setQuestion(rs.getString(5));
				optionsLs.add(op);
			}
		} catch (Exception e) {
			System.err.println("selectOptionsPro Exception:" + e);
		}
		
		return optionsLs;
	}
}
