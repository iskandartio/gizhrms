<?php
	if ($type=='load_data') {
		
		$data_limit=Medical::getLimitMany($year, 'employee_outpatient', $project_name, $project_number, $project_location);
		$data_paid=Medical::getPaidMany($year, 'employee_outpatient');
		$data['outpatient']=Medical::medicalSummaryTable($year, $data_limit, $data_paid, 'employee_outpatient');
		
		$data_limit=Medical::getLimitMany($year, 'employee_pregnancy', $project_name, $project_number, $project_location);
		$data_paid=Medical::getPaidMany($year, 'employee_pregnancy');
		
		$data['pregnancy']=Medical::medicalSummaryTable($year, $data_limit, $data_paid, 'employee_pregnancy');
		
		if ($year=='this_year') $y=date('Y'); else $y=date('Y')-1;
		$res=Eyeglasses::get_eyeglasses_paid($y);
		$res_by_year=Eyeglasses::get_eyeglasses_paid_by_year($y);
		$data['eyeglasses']=Eyeglasses::get_summary_table($y, $res, $res_by_year);
		
		$res=MedicalCheckup::get_medical_checkup_paid($y);
		$data['medical_checkup']=MedicalCheckup::get_summary_table($y, $res);
		die(json_encode($data));
	}
?>