package com._52web.web.data;

import com._52web.Uitls.JDBC.JDBCTemplatess;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

/**
 * @author MrHao
 * @date 2019/4/29 22:22
 * @Effect  用来插入一条用户数据
 */
public class UserInsert {
    public static int NewUser(String user,String pass,String emal,String phon){
        JdbcTemplate jt = JDBCTemplatess.getJt();
        String sqlCheck = "select usernum from inserUser where usernum = ?";
        List<Map<String, Object>> maps = jt.queryForList(sqlCheck, user);
        if(maps.size()==0){
            String sql = "INSERT INTO inserUser(id,usernum,passnum,userPhone,userEmail,insertTime) VALUES\n" +
                    "(NULL,'"+user+"','"+pass+"','"+phon+"','"+emal+"',NULL);";
            int update = jt.update(sql);
            return update;
        }
        return 0;
    }
}
