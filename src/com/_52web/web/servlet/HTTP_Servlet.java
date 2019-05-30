package com._52web.web.servlet;

import com._52web.Uitls.JDBC.JDBCTemplatess;
import com._52web.Uitls.JDBC.JDBCUtil;
import com._52web.Utils.Json.FastJsonUtils;
import com._52web.domain.sql.Demosql;
import com._52web.web.data.DataMysql;
import com._52web.web.data.Login;
import com._52web.web.data.UserInsert;
import jdk.nashorn.internal.runtime.JSONFunctions;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * @author MrHao
 * @date 2019/4/28 16:28
 * @Effect
 */
@WebServlet("/hello")
public class HTTP_Servlet extends HttpServlet {
    private JdbcTemplate jt;

    @Override
    public void init() {
        jt = JDBCTemplatess.getJt();
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //        req请求            resp响应
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter rWrite = resp.getWriter();
        if (req.getParameter("type").equals("0")) {//Get中状态码0表示查找指定id内容
            String id = req.getParameter("id");//这里的id表示数据库备忘录条目id
            List<Map<String, Object>> maps = jt.queryForList("select text_name,text_cont FROM usertextarea WHERE id = ?", id);
            rWrite.print(FastJsonUtils.toJSONString(maps));
        }else if(req.getParameter("type").equals("1")){//Get中状态码1表示添加一条备忘录
            String tit = req.getParameter("title");//标题
            String mas = req.getParameter("massage");//内容
            int update = jt.update("INSERT INTO usertextarea VALUES(NULL,1,?,?,NULL)", tit, mas);
            if(update==1){
                rWrite.print("<script>alert('添加成功！');" +
                        "window.location.href='/context.jsp'" +
                        "</script>");
            }else{
                rWrite.print("<script>alert('添加失败，请联系qq1650669910！');</script>");
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        JdbcTemplate jt = JDBCTemplatess.getJt();
        if (req.getParameter("type").equals("0")) { // 如果状态码是0  则为注册
            String userNum = req.getParameter("userNum");//账号
            String passNum = req.getParameter("passNum");//密码
            String emil = req.getParameter("emil");//邮箱
            String phoneNum = req.getParameter("phoneNum");//电话
            int i = UserInsert.NewUser(userNum, passNum, emil, phoneNum);//调用注册方法
            if (i >= 1) {//注册
                writer.print("<script>" +
                        "alert('注册成功');" +
                        "window.location.href=\"/context.jsp\"" +
                        "</script>");
            } else {
                writer.print("<script>" +
                        "alert('账户名重复');" +
                        "window.location.href=\"/zhuce.jsp\"" +
                        "</script>");
            }
        } else if (req.getParameter("type").equals("1")) { // 如果状态码是1  则为登录
            String user = req.getParameter("userNum");
            String pass = req.getParameter("passNum");
            boolean login = Login.getLogin(user, pass);
            if (login) {
                writer.print("<script>" +
                        "alert('登录成功');" +
                        "var sto = window.localStorage;" +
                        "sto.users ='" + user + "';" +
                        "sto.login = \"true\";" +
                        "window.location.href=\"/context.jsp\"" +
                        "</script>");
            } else {
                writer.print("<script>" +
                        "alert('账号或密码错误');" +
                        "window.location.href=\"/index.jsp\"" +
                        "</script>");
            }
        } else if (req.getParameter("type").equals("2")) {//状态码为2则为查询有多少条备忘录
            try {
                String users = req.getParameter("user");
                List<DataMysql> val = Demosql.getConeText(users);
                // String [] arr = val.toArray(new String[0]);//将集合转为数组
                String s = FastJsonUtils.toJSONString(val);
                writer.print(s);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (req.getParameter("type").equals("3")) {//状态码为3则为删除指定备忘录
            String id = req.getParameter("id");
            int update = jt.update("DELETE FROM usertextarea WHERE id = " + id);
            if (update == 1) {
                resp.getWriter().print(true);
            } else {
                resp.getWriter().print(false);
            }
        }
    }
}
