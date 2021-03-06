package com.icastle.Orders.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.icastle.members.model.MembersDAO_interface;
import com.icastle.members.model.MembersJDBCDAO;
import com.icastle.members.model.MembersVO;
import com.icastle.rooms.model.RoomsService;
import com.icastle.rooms.model.RoomsVO;

@WebServlet("/FakeDatas")
public class FakeDatas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		res.setCharacterEncoding("utf-8");
		
		PrintWriter out = res.getWriter();
//			取出旅客資料
			MembersDAO_interface mdao = new MembersJDBCDAO();
			List<MembersVO> mlist = mdao.getAll();
			Map<Integer, StringBuffer> customer = new LinkedHashMap<Integer, StringBuffer>();
			for(MembersVO member: mlist){
				if(!member.isManager()){
					StringBuffer sb = new StringBuffer();
					sb.append("N'" + member.getName() + "'" + ",");
					sb.append("'" + member.getBdate() + "'" + ",");
					sb.append("'" + member.getTel() + "'" + ",");
					sb.append("'" + member.getEmail() + "'" + ",");
					sb.append("N'" + member.getAddr() + "'" + ",");
					sb.append("'" + member.getPersonId() + "'" + ",");
					sb.append("N'" + member.getCountry() + "'" + ",");
					sb.append("'" + member.getPassport() + "'" + ",");
//					sb.append("'" + "false" + "'" + ",");
					
					customer.put(member.getMemberId(), sb);
				}
			}
			
//			System.out.println(new GregorianCalendar(2016, 0, 1).getTime());
//			System.out.println((int)(Math.random()*5.0));
			
//			System.out.println(new GregorianCalendar().getTimeInMillis());
//			System.out.println(new java.sql.Date(new GregorianCalendar().getTimeInMillis()));
//			System.out.println(new GregorianCalendar().getTimeInMillis() / (long)(Math.random()*2.0+1));
//			System.out.println(new java.sql.Date(new GregorianCalendar().getTimeInMillis() - (long)(Math.random()*31536000000.0)));
			
//			取出房型資料
			RoomsService rs = new RoomsService();
			
//			房型編號取出不同房型
			for(int j = 1; j <= 4; j++){
				
//				一年12個月，照淡旺季準備輸入訂單
				for(int i = 0; i < 7; i++){
					java.sql.Date start = new java.sql.Date(new GregorianCalendar(2017, i, 1).getTimeInMillis());
					java.sql.Date end = null;
					
//					計算大小月日期
					switch(i){
						case 3:
						case 5:
						case 8:
						case 10:
							end = new java.sql.Date(new GregorianCalendar(2017, i, 30).getTimeInMillis());
							break;
						case 1:
							end = new java.sql.Date(new GregorianCalendar(2017, i, 29).getTimeInMillis());
							break;
						default:
							end = new java.sql.Date(new GregorianCalendar(2017, i, 31).getTimeInMillis());
							break;
					}
					
//					計算淡旺季
					double vacation = 0.0;
					switch(i){
						case 0:
						case 1:
						case 11:
							vacation = 2.0;
							break;
						case 6:
						case 7:
							vacation = 2.0;
							break;
						case 3:
						case 4:
						case 10:
							vacation = 1.0;
							break;
						default:
							vacation = 1.0;
							break;
					}
					
//					房間偏好
					double popular = (j == 2 || j == 3)? 2.0 : 0.5;
					
					List<RoomsVO> rooms = rs.getRoomsByMonth(1, j, start, end);
//					System.out.println(rooms.size());
					RoomsVO roomData = rooms.get(0);
					
//					訂單飯店資料-1
					StringBuffer rdsb1 = new StringBuffer();
					rdsb1.append("'" + roomData.getRoomId() + "'" + ",");
					rdsb1.append("'" + "1" + "'" + ",");
					rdsb1.append("N'" + "德立莊酒店 (Hotel Midtown Richardson)" + "'" + ",");
					rdsb1.append("'" + roomData.getRoomTypeId() + "'" + ",");
					rdsb1.append("N'" + roomData.getRoomTypeName() + "'" + ",");
					
//					rdsb.append("'" + roomData.getRoomDate() + "'" + ",");
//					rdsb.append("'" + new java.sql.Date(roomData.getRoomDate().getTime() + 86400000) + "'" + ",");
					
//					訂單飯店資料-2
					StringBuffer rdsb2 = new StringBuffer();
					rdsb2.append("'" + "1" + "'" + ",");
					rdsb2.append("'" + roomData.getPeopleNum() + "'" + ",");
					rdsb2.append("'" + roomData.isBreakfast() + "'" + ",");
					rdsb2.append("'" + roomData.isDinner() + "'" + ",");
					rdsb2.append("'" + roomData.isAfternoonTea() + "'" + ",");
					
//					rdsb2.append("'" + roomData.getPrice() + "'" + ",");
//					rdsb2.append("null" + ",");
					
//					訂單備註
//					成立訂單
//					StringBuffer endsb = new StringBuffer();
//					endsb.append("null" + ",");
//					endsb.append("N'" + roomData.getRemark() + "'" + ",");
//					endsb.append("null" + ",");
//					endsb.append("'" + "true" + "'" + ",");
//					endsb.append("null");
//					endsb.append("'" +  + "'" + ",");

					for(RoomsVO room: rooms){
						
//						取得入住退房日
						java.sql.Date checkin = room.getRoomDate();
						long timemin = 0;
						do{
							timemin = (long)(Math.random()*31536000000.0);
						}while(timemin >= new GregorianCalendar(2017,5,26).getTimeInMillis());
						java.sql.Timestamp ordered = new java.sql.Timestamp(checkin.getTime() - timemin);
						
//						取消訂單
						StringBuffer endsb = new StringBuffer();
						endsb.append("null" + ",");
						endsb.append("N'" + roomData.getRemark() + "'" + ",");
						endsb.append("null" + ",");
						endsb.append("'" + "false" + "'" + ",");
						
//						計算取消日期
						java.sql.Timestamp cancel = new java.sql.Timestamp(checkin.getTime() - (long)(Math.random()*31536000000.0));
						endsb.append("'" + cancel + "'");
//						endsb.append("'" +  + "'" + ",");
						
//						2016連假機率增加
//						double lv = 1.0;
//						switch(String.valueOf(checkin)){
//							case "2016-01-01":
//							case "2016-01-02":
//							case "2016-01-03":
//							case "2016-02-06":
//							case "2016-02-07":
//							case "2016-02-08":
//							case "2016-02-09":
//							case "2016-02-10":
//							case "2016-02-11":
//							case "2016-02-27":
//							case "2016-02-28":
//							case "2016-02-29":
//							case "2016-04-02":
//							case "2016-04-03":
//							case "2016-04-04":
//							case "2016-04-05":
//							case "2016-06-09":
//							case "2016-06-10":
//							case "2016-06-11":
//							case "2016-06-12":
//							case "2016-09-15":
//							case "2016-09-16":
//							case "2016-09-17":
//							case "2016-09-18":
//							case "2016-10-08":
//							case "2016-10-09":
//							case "2016-10-10":
//							case "2016-12-31":
//								lv = 6.0;
//								break;
//							case "2016-09-10":
//								lv = 0.25;
//								break;
//						}
						
//						2017連假機率增加
						double lv = 1.0;
						switch(String.valueOf(checkin)){
							case "2016-12-31":
							case "2017-01-01":
							case "2017-01-02":
							case "2017-01-27":
							case "2017-01-28":
							case "2017-01-29":
							case "2017-01-30":
							case "2017-01-31":
							case "2017-02-01":
							case "2017-02-25":
							case "2017-02-26":
							case "2017-02-27":
							case "2017-02-28":
							case "2017-04-01":
							case "2017-04-02":
							case "2017-04-03":
							case "2017-04-04":
							case "2017-04-29":
							case "2017-04-30":
							case "2017-05-01":
							case "2017-05-27":
							case "2017-05-28":
							case "2017-05-29":
							case "2017-05-30":
							case "2017-10-04":
							case "2017-10-07":
							case "2017-10-08":
							case "2017-10-09":
							case "2017-10-10":
								lv = 6.0;
								break;
							case "2017-02-18":
							case "2017-06-03":
							case "2017-06-30":
								lv = 0.25;
								break;
						}

//						週末機率增加
						double week = 0.5;
						SimpleDateFormat sdf = new SimpleDateFormat("u");
						if("5".equals(sdf.format(checkin)) || "6".equals(sdf.format(checkin))){
							week = 2.0;
						}
						
//						印出指令
						for(int k = 1; k <= room.getRoomNumber(); k++){
							if(Math.random()*10.0*week*popular*vacation*lv >= 25.0){
								
//								計算退房日
								long stayNight = 0;
								do{
									stayNight = (long)(Math.random()*86400000.0*3.0);
								}while(stayNight <= 86400000);
								java.sql.Date checkout = new java.sql.Date(room.getRoomDate().getTime() + stayNight);
								
//								計算房間金額
								Integer stayDayNum = (int)(stayNight / 86400000);
								SimpleDateFormat sdft = new SimpleDateFormat("yyyy/MM/dd");
								Map<String,Integer> perPrice = rs.getPerPriceByAuto(room.getRoomId(), room.getHotelId(), room.getRoomTypeId(), sdft.format(checkin).toString(), sdft.format(checkout).toString(), stayDayNum);
								
//								判斷是否加床
								Boolean bedadd = false;
								Integer personPerPrice = 0;
								if(room.isBedAddable()){
									if((int)(Math.random()*10.0) < 5){
										bedadd = true;
										personPerPrice = room.getPricePerPerson();
									}
								}
								
//								計算總金額
								Integer price = rs.getTotalPrice(perPrice) + personPerPrice*stayDayNum;
								
//								串接指令
								StringBuffer result = new StringBuffer();
								result.append("insert into orders values(");
								result.append("'" + ordered + "'" + ",");
								int memberId = 0;
								do{
									memberId = (int)(Math.random()*16.0);
								}while(memberId <= 5);
								result.append("'" + memberId + "'" + ",");
								result.append(rdsb1);
								result.append("'" + checkin + "'" + ",");
								result.append("'" + checkout + "'" + ",");
								result.append(rdsb2);
								result.append("'" + price + "'" + ",");
								result.append("null" + ",");
								result.append(customer.get(memberId));
								result.append("'" + bedadd + "'" + ",");
								result.append("'" + personPerPrice + "'" + ",");
								result.append(endsb);
								result.append(")");
								
								out.println(result);
							}
						}
					}
				}
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
