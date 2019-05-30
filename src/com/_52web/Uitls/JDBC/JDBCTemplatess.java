package com._52web.Uitls.JDBC;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * @author MrHao
 * @date 2019/4/29 18:27
 * @Effect 私有化jdbcTemplat
 */
public class JDBCTemplatess {
    private static final JdbcTemplate jt = new JdbcTemplate(JDBCUtil.getDataSource());
    private JDBCTemplatess() {
    }
    public static JdbcTemplate getJt() {
        return jt;
    }
}
