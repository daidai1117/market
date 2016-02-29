package com.gtja.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gtja.dao.GoodsDao;
import com.gtja.dao.MemberDao;
import com.gtja.entity.Goods;
import com.gtja.entity.Member;

@Controller
public class MarketController {
	
	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private MemberDao memberDao;
	
	//购物车
	private ArrayList<Goods> shopcart = new ArrayList<Goods>();
	
	@ResponseBody
	@RequestMapping(value="/goodslist.do", produces="text/plain;charset=utf-8")
	public String findAllGoods(){
		List<Goods> goodsList = goodsDao.findAll();
		JSONArray jsonlist = JSONArray.fromObject(goodsList);
		return jsonlist.toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/memberslist.do", produces="text/plain;charset=utf-8")
	public String findAllMembers(HttpServletResponse response) throws IOException{
		List<Member> membersList = memberDao.findAll();
		System.out.println("membersList："+membersList);
		
		
		JSONArray jsonlist = JSONArray.fromObject(membersList);
		System.out.println("jsonlist:"+jsonlist);

		/*JsonConfig config = new JsonConfig();  
		DataJsonValueProcessor dataValue=new DataJsonValueProcessor();
		config.registerJsonValueProcessor(Timestamp.class, dataValue);  
		JSONArray membersLstJson = JSONArray.fromObject(membersList,config);  
		System.out.println("membersLstJson:"+membersLstJson);*/
		
		return jsonlist.toString();
//		return membersList.toString();
//		response.getWriter().write(membersList.toString());
	}
	
	
	/**
	 * 柜台扫描
	 * @param response
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value="/counter.do", produces="text/plain;charset=utf-8")
	public void counter(HttpServletResponse response, String barcode) throws IOException {
		response.setCharacterEncoding("utf-8");
		System.out.println("barcode:"+barcode);
		if(null!=barcode && !"".equals(barcode)){
			Goods goods = goodsDao.findByBarcode(barcode);
			System.out.println("goods:"+goods);
			shopcart.add(goods);
		}
			JSONArray jsonobj = JSONArray.fromObject(shopcart);
			response.getWriter().write(jsonobj.toString());
	}
	
	
	/**
	 * 清空购物车
	 */
	@ResponseBody
	@RequestMapping(value="/clearShopcart.do", produces="text/plain;charset=utf-8")
	public void clearShopcart(HttpServletResponse response, String barcode) throws IOException {
		shopcart.clear();
		JSONArray jsonobj = JSONArray.fromObject(shopcart);
		response.getWriter().write(jsonobj.toString());
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/test.do", produces="text/plain;charset=utf-8")
	public void test(HttpServletResponse response) throws IOException {
	    String jsondata = "{\"page\":\"1\"," +
	        "      \"total\":2," +
	        "      \"records\":\"13\"," +
	        "      \"rows\":" +
	        "          [" +
	        "            {" +
	        "              \"id\":\"13\"," +
	        "              \"cell\":" +
	        "                  [\"13\",\"2007-10-06\",\"Client 3\",\"1000.00\",\"0.00\",\"1000.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"12\"," +
	        "              \"cell\":" +
	        "                  [\"12\",\"2007-10-06\",\"Client 2\",\"700.00\",\"140.00\",\"840.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"11\"," +
	        "              \"cell\":" +
	        "                  [\"11\",\"2007-10-06\",\"Client 1\",\"600.00\",\"120.00\",\"720.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"10\"," +
	        "              \"cell\":" +
	        "                  [\"10\",\"2007-10-06\",\"Client 2\",\"100.00\",\"20.00\",\"120.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"9\"," +
	        "              \"cell\":" +
	        "                  [\"9\",\"2007-10-06\",\"Client 1\",\"200.00\",\"40.00\",\"240.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"8\"," +
	        "              \"cell\":" +
	        "                  [\"8\",\"2007-10-06\",\"Client 3\",\"200.00\",\"0.00\",\"200.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"7\"," +
	        "              \"cell\":" +
	        "                  [\"7\",\"2007-10-05\",\"Client 2\",\"120.00\",\"12.00\",\"134.00\",null]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"6\"," +
	        "              \"cell\":" +
	        "                  [\"6\",\"2007-10-05\",\"Client 1\",\"50.00\",\"10.00\",\"60.00\",\"\"]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"5\"," +
	        "              \"cell\":" +
	        "                  [\"5\",\"2007-10-05\",\"Client 3\",\"100.00\",\"0.00\",\"100.00\",\"no tax at all\"]" +
	        "            }," +
	        "            {" +
	        "              \"id\":\"4\"," +
	        "              \"cell\":" +
	        "                  [\"4\",\"2007-10-04\",\"Client 3\",\"150.00\",\"0.00\",\"150.00\",\"no tax\"]" +
	        "            }" +
	        "          ]," +
	        "      \"userdata\":{\"amount\":3220,\"tax\":342,\"total\":3564,\"name\":\"Totals:\"}" +
	        "    }";
	    response.getWriter().write(jsondata);
	  }
	
	@RequestMapping(value="/RowEditing.do", produces="text/plain;charset=utf-8")
	public void RowEditing() throws IOException {
		System.out.println("Hello World");
		System.out.println("pppppp");
	}
}
