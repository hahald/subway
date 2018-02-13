package com.kuizei.dao;

import org.hibernate.dialect.MySQLDialect;
import org.hibernate.dialect.function.SQLFunctionTemplate;
import org.hibernate.type.IntegerType;

/**
 * \* Created with IntelliJ IDEA.
 * \* User: ZhaoTao
 * \* Date: 2017/10/11
 * \* Time: 11:10
 * \* Description:
 * \
 */
public class RegMySQLDialect extends MySQLDialect {
    /**
     * 添加sql regexp表达式的使用
     */
    public RegMySQLDialect() {
        super();
        registerFunction("regexp", new SQLFunctionTemplate(IntegerType.INSTANCE, "?1 REGEXP ?2"));
    }
}