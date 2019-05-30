package com._52web.web.data;

import java.util.Date;
import java.util.Objects;

/**
 * @author MrHao
 * @date 2019/4/29 18:39
 * @Effect  用来封装备忘录标题
 */
public class DataMysql {
    private Integer id;
    private String text_name;
    private Date text_time;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DataMysql dataMysql = (DataMysql) o;
        return Objects.equals(id, dataMysql.id) &&
                Objects.equals(text_name, dataMysql.text_name) &&
                Objects.equals(text_time, dataMysql.text_time);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, text_name, text_time);
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("DataMysql{");
        sb.append("id=").append(id);
        sb.append(", text_name='").append(text_name).append('\'');
        sb.append(", text_time=").append(text_time);
        sb.append('}');
        return sb.toString();
    }

    public DataMysql() {
    }

    public Integer getId() {

        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText_name() {
        return text_name;
    }

    public void setText_name(String text_name) {
        this.text_name = text_name;
    }

    public Date getText_time() {
        return text_time;
    }

    public void setText_time(Date text_time) {
        this.text_time = text_time;
    }

    public DataMysql(Integer id, String text_name, Date text_time) {

        this.id = id;
        this.text_name = text_name;
        this.text_time = text_time;
    }
}
