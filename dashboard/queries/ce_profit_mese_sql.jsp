<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="dbconnection" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://${initParam.dbURL}/${initParam.dbinitcat}" user="${initParam.dbuserid}" password="${initParam.dbuserpwd}" />
<sql:query dataSource="${dbconnection}" var="results">
call ce_ric_mese_procedure(24)
UNION 
call ce_ric_mese_procedure(25)
UNION
call ce_ric_mese_procedure(26)
;
</sql:query>