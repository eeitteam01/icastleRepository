package com.icastle.record.model;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.TimeZone;

public class RecordService {

	RecordDAO_interface dao = null;
	
	public RecordService(){
		dao = new RecordHibernateDAO();
	}
	
//	飯店更改房型紀錄用
	public void hotelRecord(List<RecordVO> recordsList){
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Taipei"));
		java.sql.Timestamp time = new java.sql.Timestamp(new GregorianCalendar().getTimeInMillis());
		
		for(RecordVO record : recordsList){
			record.setRecordTime(time);
		}
		
		dao.hotelRecord(recordsList);
	}
	
//	管理員更改紀錄用
	public void managerRecord(RecordVO record){
		
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Taipei"));
		java.sql.Timestamp time = new java.sql.Timestamp(new GregorianCalendar().getTimeInMillis());
		
		record.setRecordTime(time);
		
		dao.managerRecord(record);
	}
	
//	使用ID查詢飯店歷史紀錄
	public List<RecordVO> search_hotel_records_by_id(Integer hotelId){
		String id = "h" + hotelId;
		
		return dao.select_by_id(id);
	}
	
//	使用ID查詢飯店歷史紀錄
	public List<RecordVO> search_hotel_records_by_roomTypeId(Integer roomTypeId){
		return dao.select_by_roomTypeId(roomTypeId);
	}
	
//	使用ID查詢管理員歷史紀錄
	public List<RecordVO> search_manager_records_by_id(String managerId, String classification){
		String id = "m" + managerId;
		
		if("0".equals(classification)){
			return dao.select_by_id(id);
		}else{
			return dao.select_by_class_id(id, classification);
		}
	}
	
//	使用名稱查詢歷史紀錄
	public List<RecordVO> search_records_by_name(String name, String classification, String id){
		String search_name = "%" + name + "%";
		
		if("0".equals(classification)){
			return dao.select_by_name(search_name, id);
		}else{
			return dao.select_by_class_name(search_name, classification, id);
		}
	}
}
