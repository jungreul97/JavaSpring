package org.ict.dao;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
public class OjdbcConnectiontest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver" );
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521/XEPDB1",
						"mytest",
						"mytest")){
				log.info(con);
				log.info("연결이 제대로 되었습니다");
			}catch(Exception e) {
				fail(e.getMessage());
		}
	}
	
	
	
	
	
}
