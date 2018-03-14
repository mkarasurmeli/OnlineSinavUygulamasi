package com.calisma.onlinesinav;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Properties.questionPro;
import Utils.Db;

@Controller
public class HomeController {

	Db db = new Db("examapp", "root", "");

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "/exam", method = RequestMethod.GET)
	public String axam() {

		return "exam";
	}

	@RequestMapping(value = "/questions", method = RequestMethod.GET)
	public String questions(Model model) {
		List<questionPro> questionLs = fillQuestionTable();
		if (questionLs.size() > 0) {
			model.addAttribute("qLs", questionLs);
		}
		return "questions";
	}


	
	public List<questionPro> fillQuestionTable() {
		List<questionPro> questionLs = new ArrayList<questionPro>();
		try {

			String query = "call selectQuestionsPro()";
			ResultSet rs = db.connect().executeQuery(query);
			while (rs.next()) {
				questionPro qp = new questionPro();
				qp.setqId(rs.getInt(1));
				qp.setQuestion(rs.getString(2));
				questionLs.add(qp);
			}

		} catch (Exception e) {
			System.err.println("selectQuestionPro Exception:" + e);
		}

		return questionLs;

	}

	
	
	
}
