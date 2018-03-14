package com.calisma.onlinesinav;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Properties.optionPro;
import Properties.questionPro;
import Properties.selectionPro;
import Utils.Db;

@Controller
public class ExamController {

	Db db = new Db("examapp", "root", "");

	@RequestMapping(value = "/examStart", method = RequestMethod.GET)
	public String examstart(Model model) {
		model.addAttribute("examSt", "Sýnav Baþladý.");
		System.out.println("i:" + i);
		i = 0;
		List<questionPro> qLs = fillQuestionTable();
		List<optionPro> examLs = new QuestionsController().selectOptions((qLs.get(0).getqId() + ""));
		model.addAttribute("i",(i+1));
		model.addAttribute("question",qLs.get(0).getQuestion());
		model.addAttribute("examSt", "Sýnav Baþladý.");
		if (examLs.size() > 0) {
			model.addAttribute("examLs", examLs);
			System.out.println(" exam list gonderildi");
		}
		return "exam";
	}

	int i = 0;

	@RequestMapping(value = "/examx", method = RequestMethod.POST)
	public String axam(Model model , @RequestParam(defaultValue = "0") String option) {
		
		model.addAttribute("examSt", "Sýnav Baþladý.");
		i++;
		
		List<questionPro> qLs = fillQuestionTable();
		
		if (qLs.size() > i) {
			
			model.addAttribute("i",(i+1));
			model.addAttribute("question",qLs.get(i).getQuestion());
			
			String questionId=qLs.get(i).getqId() + "";
			List<optionPro> examLs = new QuestionsController().selectOptions((questionId));
			insertSelection(option,questionId);
			if (examLs.size() > 0) {
				model.addAttribute("examLs", examLs);
				System.out.println(" exam list gonderildi");
			}
			
		}
		return "exam";
	}

	public List<questionPro> fillQuestionTable() {
		List<questionPro> questionLs = new ArrayList<questionPro>();
		try {

			String query = "call selectExistQuestion()";
			ResultSet rs = db.connect().executeQuery(query);
			while (rs.next()) {
				questionPro qp = new questionPro();
				qp.setqId(rs.getInt(1));
				qp.setQuestion(rs.getString(2));
				questionLs.add(qp);
			}

		} catch (Exception e) {
			System.err.println("selectExistQuestion Exception:" + e);
		}

		return questionLs;

	}

	public void insertSelection(String s,String q) {
		try {
			PreparedStatement prs = db.preConnect("call insertSelectionPro(?,?)");
			prs.setString(1, s);
			prs.setString(2, q);
			int ans = prs.executeUpdate();
			if (ans > 0) {
				System.out.println("insertSelectionPro successfull");
			}

		} catch (Exception e) {
			System.err.println("insertSelectionPro Exception:" + e);
		}
	}
	
	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String result(Model model) {
		List<selectionPro> selectionLs=selectSelection();
		for (selectionPro selectionPro : selectionLs) {
			System.out.println(selectionPro.getAnswer());
		}
		model.addAttribute("selectionLs",selectionLs); 
		return "result";
	}
	
	public List<selectionPro>  selectSelection() {
		List<selectionPro> selectionLs = new ArrayList<selectionPro>();
		try {
			String q = "call selectSelectionPro()";
			ResultSet rs = db.connect().executeQuery(q);
			int i = 0 ;
			while (rs.next()) {
				selectionPro sp = new selectionPro();
				i++;
				sp.setqId(i+"");
				sp.setQuestion(rs.getString(2));
				sp.setAnswer(rs.getString(3));
				System.out.println(sp.getAnswer() + "EKLENDI...");
				selectionLs.add(sp);
			} 
		} catch (Exception e) {
			System.err.println("selectOptionsPro Exception:" + e);
		}
		
		return selectionLs;
	}
	
	
}
