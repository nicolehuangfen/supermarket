package com.UserBean;

import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import com.DBConn.DBAccess;

public class UserBean {
	ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();

	// login check
	public boolean valid(String username, String password) {
		boolean b = false;
		DBAccess db = new DBAccess();
		System.out.println(db.createConn());
		if (db.createConn()) {
			String sql = "select * from user where username = '" + username
					+ "'and userpwd = '" + password + "'";
			System.out.println(sql);
			db.query(sql);
			if (db.next())
				b = true;
			db.closeDB();
		}
		return b;
	}

	// register check
	public boolean isExist(String username) {
		boolean isExist = false;
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "select * from user where username = '" + username
					+ "'";
			db.query(sql);
			if (!db.next())
				isExist = true;
		}
		db.closeDB();
		return isExist;
	}

	// reset check 用户名和密码是否匹配
	public boolean isMatch(String username, String password)
			throws SQLException {
		boolean isMatch = false;
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "select * from user where username = '" + username
					+ "' and userpwd='" + password + "'";
			db.query(sql);
			if (db.next()) {
				isMatch = true;
			}
		}
		return isMatch;
	}

	// add user
	public void add(String username, String password, String email) {
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "insert into user(username, userpwd, user_email) "
					+ "value('" + username + "','" + password + "','" + email
					+ "')";
			db.update(sql);
			db.closeDB();
		}
	}

	// add order
	public void addOrder(String username, int id) throws SQLException {
		int ordercount = 1;
		String oid;
		DBAccess db = new DBAccess();
		String buytime = new SimpleDateFormat("yyyy-MM-dd").format(Calendar
				.getInstance().getTime());
		int rand = (int) (Math.random() * 1000);
		oid = new SimpleDateFormat("yyyyMMdd").format(Calendar.getInstance()
				.getTime()) + rand;
		HashMap<String, String> hash = getGoodDetail(id);// id 为商品编号

		String sql = "insert into order_detail(oid,username,good_id,good_name,gprice,ordercount,buytime)"
				+ "value('"
				+ oid
				+ "','"
				+ username
				+ "',"
				+ hash.get("good_id")
				+ ",'"
				+ hash.get("good_name")
				+ "',"
				+ hash.get("gprice") + "," + ordercount + ",'" + buytime + "')";
		String sql1 = "select * from order_detail where username='" + username
				+ "' and good_id=" + hash.get("good_id") + "";
		if (db.createConn()) {
			db.query(sql1);
			if (db.next()) {
				ordercount++;
				String sql2 = "update order_detail set ordercount="
						+ ordercount + " where username='" + username
						+ "'and good_id=" + hash.get("good_id") + "";
				System.out.println(sql2);
				db.update(sql2);
				System.out.println("*******************" + db.update(sql2));
				System.out.println("---------- ordercount+1 ----------");
			} else if (db.update(sql)) {
				System.out.println("--------db.update----------");
				System.out.println("插入到订单明细表成功！订单编号n=" + oid);
			}

		}

	}

	// show user order
	public ArrayList<HashMap<String, String>> queryOrder(String username)
			throws SQLException {
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "select * from order_detail where username='"
					+ username + "'";
			db.query(sql);
			ResultSet rs = db.getRs();
			while (db.next()) {
				HashMap<String, String> hash = new HashMap<String, String>();
				hash.put("oid", rs.getString(1));
				hash.put("username", rs.getString(2));
				hash.put("good_id", rs.getString(3));
				hash.put("good_name", rs.getString(4));
				hash.put("gprice", rs.getString(5));
				hash.put("ordercount", rs.getString(6));
				hash.put("buytime", rs.getString(7));
				list.add(hash);
			}
		}
		return list;
	}

	// update
	public boolean update(String username, String password, String newPassword) {
		boolean update = false;
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "update user set userpwd = '" + newPassword
					+ "' where username='" + username + "'";
			db.update(sql);
			update = true;
			System.out.println(sql);
			db.closeDB();
		}
		return update;

	}

	// get goodDetail
	public HashMap<String, String> getGoodDetail(int n) throws SQLException {
		DBAccess db = new DBAccess();
		HashMap<String, String> hash = new HashMap<String, String>();
		if (db.createConn()) {
			String sql = "select * from goods where good_id=" + n + "";
			db.query(sql);
			ResultSet rs = db.getRs();
			if (db.next()) {
				hash.put("good_id", rs.getString(1));
				hash.put("good_name", rs.getString(2));
				hash.put("gtype", rs.getString(3));
				hash.put("gprice", rs.getString(4));
				hash.put("gdate", rs.getString(5));
				hash.put("gcount", rs.getString(6));
				hash.put("gimgurl", rs.getString(7));
				hash.put("gintroduction", rs.getString(8));
			}
		}
		return hash;
	}

	// plus gcount
	public void addOrdercount(String oid) throws SQLException {
		DBAccess db = new DBAccess();
		String username;
		int good_id, ordercount;
		ResultSet rs = null;
		if (db.createConn()) {
			String sql = "select * from order_detail where oid = '" + oid + "'";
			db.query(sql);
			rs = db.getRs();
			if (db.next()) {
				username = rs.getString(2);
				good_id = rs.getInt(3);
				ordercount = rs.getInt(6);
				ordercount++;
				String sql1 = "update order_detail set ordercount='"
						+ ordercount + "'" + " where username='" + username
						+ "' and good_id='" + good_id + "'";
				db.update(sql1);
				db.closeDB();
			}
		}
	}

	// minus gcount
	public void minusOrdercount(String oid) throws SQLException {
		DBAccess db = new DBAccess();
		String username;
		int good_id, ordercount;
		if (db.createConn()) {
			String sql = "select * from order_detail where oid = '" + oid + "'";
			db.query(sql);
			ResultSet rs = db.getRs();
			if (db.next()) {
				username = rs.getString(2);
				good_id = rs.getInt(3);
				ordercount = rs.getInt(6);
				if (ordercount == 1) {
					String sql2 = "delete from order_detail where oid = '"
							+ oid + "'";
					db.update(sql2);
				}

				ordercount--;
				String sql1 = "update order_detail set ordercount='"
						+ ordercount + "'" + " where username='" + username
						+ "' and good_id='" + good_id + "'";
				db.update(sql1);
				db.closeDB();
			}
		}
	}

	// 删除个人订单中商品
	public void deleteOrder(String oid) {
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "delete from order_detail where oid='" + oid + "'";
			db.update(sql);
		}
		db.closeDB();
	}

	// 合计订单中总价格
	public double allprice(String username) throws SQLException {
		DBAccess db = new DBAccess();
		double allprice1 = 0;
		double price = 0;
		int ordercount = 0;
		if (db.createConn()) {
			String sql = "select * from order_detail where username='"
					+ username + "'";
			db.query(sql);
			ResultSet rs = db.getRs();
			while (db.next()) {
				price = rs.getDouble(5);
				ordercount = rs.getInt(6);
				allprice1 = allprice1 + price * ordercount;
			}
		}
		return allprice1;
	}

	// 将收货信息写入到数据库订单中
	public boolean addOrderInfo(String username, String receivename,
			String receiveadds, String receivetel) throws SQLException,
			UnsupportedEncodingException {
		boolean addorder = false;
		DBAccess db = new DBAccess();
		double allmoney = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String buytime = sdf.format(new Date());
		if (db.createConn()) {
			String sql1 = "select * from order_detail where username ='"
					+ username + "'";
			db.query(sql1);
			while (db.next()) {
				System.out.println("---------------------------");
				ResultSet rs1 = db.getRs();
				allmoney = (double) rs1.getDouble(5) * rs1.getInt(6);
				String good_name = null;
				int good_count = 0;
				good_name = rs1.getString(4);
				good_count = rs1.getInt(6);
				String sql2 = "insert into user_order(oid,username,good_name,good_count,receivename,receiveadds,receivetel,allmoney,status,buytime)"
						+ " values('"
						+ rs1.getString(1)
						+ "','"
						+ username
						+ "','"
						+ good_name
						+ "',"
						+ good_count
						+ ",'"
						+ receivename
						+ "','"
						+ receiveadds
						+ "','"
						+ receivetel
						+ "',"
						+ allmoney
						+ ",0,'"
						+ buytime
						+ "')";
				addorder = db.update(sql2);
				System.out.println("----------更新状态：" + addorder);
				if (addorder == true) {
					System.out.println(rs1.getString(1)+":加入订单表成功!");
					String sql = "delete from order_detail where oid='"
							+ rs1.getString(1) + "'";
					db.update(sql);
					addorder = false;
				}
			}
		}
		db.closeDB();
		return addorder;
	}

	// add userOrder
	public ArrayList<HashMap<String, String>> addUserOrder(String username)
			throws SQLException {
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql1 = "select * from user_order where username='"
					+ username + "'";
			db.query(sql1);
			ResultSet rs1 = db.getRs();
			String oid, good_name = null;
			double money, allmoney = 0;
			int good_count;
			Date buytime;
			int status;
			while (db.next()) {
				oid = rs1.getString(1);
				good_name = rs1.getString(3);
				good_count = rs1.getInt(4);
				money = rs1.getDouble(8);
				status = rs1.getInt(9);
				buytime = rs1.getDate(10);
				allmoney = allmoney + money;
				SimpleDateFormat formatter = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String date = formatter.format(buytime);

				HashMap<String, String> hash = new HashMap<String, String>();
				hash.put("oid", oid);
				hash.put("good_name", good_name);
				hash.put("good_count", String.valueOf(good_count));
				hash.put("money", String.valueOf(money));
				hash.put("buytime", date);
				hash.put("status", String.valueOf(status));
				list.add(hash);
			}
		}
		return list;
	}

	//退货
	public void deleteMyOrder(String oid) {
		DBAccess db = new DBAccess();
		if (db.createConn()) {
			String sql = "delete from user_order where oid='" + oid + "'";
			db.update(sql);
		}
		db.closeDB();
	}
	
	public static void main(String args[]) throws SQLException, ParseException {
		UserBean userbean = new UserBean();
		ArrayList<HashMap<String, String>> list;
		// Date date = null;
		// SimpleDateFormat formatter = new
		// SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		list = userbean.addUserOrder("hf");
		for (int i = 0; i < list.size(); i++) {
			HashMap<String, String> hash = list.get(i);
			// date = formatter.parse(hash.get("buytime"));
			System.out.println(hash);
		}
	}
}
