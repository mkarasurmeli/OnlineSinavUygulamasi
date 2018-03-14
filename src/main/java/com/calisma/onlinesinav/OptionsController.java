package com.calisma.onlinesinav;

import java.sql.PreparedStatement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Utils.Db;

@Controller
public class OptionsController {

	Db db = new Db("examapp", "root", "");

	@RequestMapping(value = "/options/{qId}", method = RequestMethod.POST)
	public String optionadd(@PathVariable String qId, @RequestParam String option, @RequestParam String DY) {

		try {
			String query = " call insertOptionPro(?,?,?)";
			PreparedStatement prs = db.preConnect(query);
			prs.setString(1, qId);
			prs.setString(2, option);
			prs.setString(3, DY);
			int ans = prs.executeUpdate();
			if (ans > 0) {
				System.out.println("insertOptionPro successfull");
			}
		} catch (Exception e) {
			System.err.println("insertOptionPro Exception:" + e);
		}
		return "redirect:/options/" + qId;
	}

	@RequestMapping(value = "/optionDelete/{qId}/{oId}", method = RequestMethod.GET)
	public String deleteQuestion(@PathVariable String oId,@PathVariable String qId) {
		System.out.println("silinecek olan secenek:" + oId);

		String query = "call deleteOptionPro('" + oId + "')";
		try {
			int ans = db.connect().executeUpdate(query);
			if (ans > 0) {
				System.out.println("deleteOptionPro successfull");
			}
		} catch (Exception e) {
			System.err.println("deleteOptionPro Exception:" + e);
		}
		return "redirect:/options/" + qId;
	}

	
}
