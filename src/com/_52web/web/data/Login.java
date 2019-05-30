package com._52web.web.data;

import com._52web.Uitls.JDBC.JDBCTemplatess;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;
import java.util.Map;

/**
 * @author MrHao
 * @date 2019/4/30 12:43
 * @Effect  登录  通过账号密码判断数据库中是否存在此人
 */
public class Login {
    public static boolean getLogin(String userNum,String passNum){
        JdbcTemplate jt = JDBCTemplatess.getJt();
        String sql = "SELECT passnum FROM inserUser WHERE usernum = ? AND passnum = ?";
        List<Map<String, Object>> bool = null;
        boolean falg = false;
        try {
            bool = jt.queryForList(sql, userNum,passNum);
            if(bool.size()>0){
                falg = true;
            }
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
        return falg;
    }
}