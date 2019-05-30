package com._52web.Uitls.JDBC;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JDBCUtil {
    /*
    1_ 静态代码区域加载配置文件,创建DataSource
    2_ 获取连接
    3_ 释放资源
    4_ 获取连接池
     */

    private static DataSource dataSource=null;

    static{
        try {
            // 新建properties集合  为了调用其load方法
            Properties prop=new Properties();
            //读取druid.properties文件中的内容    下面代码是固定格式
            prop.load(JDBCUtil.class.getClassLoader().getResourceAsStream("druid.properties"));
            //使用Druid连接池并将读取到的内容传参给连接池 拿到连接池对象
            dataSource=DruidDataSourceFactory.createDataSource(prop);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //
    public static Connection getConnection(){// 封装连接对象   返回一个连接
        Connection conn=null;
        try {
            conn=dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }


    public static void close(ResultSet resultSet,Statement stmt,Connection conn){// 关闭流
        try {
            if(null!=resultSet){
                resultSet.close();
                resultSet=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if(null!=stmt){
                stmt.close();
                stmt=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if(null!=conn){
                conn.close();
                conn=null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    public static DataSource getDataSource(){
        return dataSource;
    }// 返回连接池对象


    public static void main(String[] args) {
        System.out.println(JDBCUtil.getConnection());
    }

}
