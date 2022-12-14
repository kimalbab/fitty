package com.project.fitty.approval.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ApprVacation {
	
	private String apprNo;
	private String vctStatus;
	private String vctStartDate;
	private String vctEndDate;
	private String vctReason;
	private String vctCount;
	
	//
	private String empName;
	private String empNo;
	private String apprEnrollDate;
	private String grApprGrade;
	private String apprDocType;
}
