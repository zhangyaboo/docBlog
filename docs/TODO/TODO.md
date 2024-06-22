### 储存过程示例：

```java
public String getcntrno(String comp, int deptId, String cllx, String azlgsdm,String asqbh) throws CommonException {

        String strCNTRTNO = "";
        Connection connection = null;
        try {
            logger.info("--------调用获取合同编号存储过程 start---");
            // 获取数据源
            DataSource dataSource = (DataSource) ApplicationContextUtils.getBean("defaultDataSource");
            connection = dataSource.getConnection();
            // 设置调用的存储过程名
            CallableStatement proc = connection.prepareCall(IfincarConstants.GETCNTRNO);
            // 设置输入参数值1的值
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");//时间戳
            proc.setString(1, sdf.format(date));//strYYYYMMDD IN VARCHAR2：表示合同生效日期（即 起租日期，例如：20180109）
            proc.setString(2, comp);//nCOMP IN VARCHAR2：公司别（若是‘仲利’，传入28；若为‘仲津’，传入29）
            proc.setBigDecimal(3, new BigDecimal("1"));//nBUSN_TYP IN NUMBER：固定参数 1（资租）
            proc.setInt(4, deptId);//nCNTRT_DEPT_ID IN NUMBER：我司业务经办所在的科组单位部门ID值
            proc.setInt(5, 2);//nTYP_IND IN NUMBER：固定参数 2（大小批案件）
            proc.setBigDecimal(6, new BigDecimal("2"));//nIS_HOSPITAL IN NUMBER：固定参数 2
            proc.setBigDecimal(7, new BigDecimal("1"));//nIS_CAR_LOAN IN NUMBER：固定参数 1
            proc.setString(8, cllx);//nAF_CAR_LOAN IN VARCHAR2：依据睿民系统传入‘车贷类型’ID值（新车：1   二手车：2   车抵贷：3   车库融：4）
            proc.setString(9, azlgsdm);//nAF_APR_NO IN VARCHAR2：依据睿民系统传入‘渠道商代码’值
            proc.setString(10, "CARLOAN");//strPUB_SYS
            proc.setString(11, asqbh);//strKEY_VALUE
            // 设置输出参数及返回类型
            proc.registerOutParameter(12, Types.VARCHAR);
            proc.registerOutParameter(13, Types.VARCHAR);
            //执行存储过程
            proc.execute();
            strCNTRTNO = proc.getString(12);
            String strErrMsg = proc.getString(13);
            connection.close();
            logger.info("--------调用获取合同编号存储过程 end  ---");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return strCNTRTNO;
    }
```

```SQL
create PROCEDURE        Getcntrno (strYYYYMMDD IN VARCHAR2, nCOMP IN VARCHAR2, nBUSN_TYP IN NUMBER,
                                              nCNTRT_DEPT_ID IN NUMBER, nTYP_IND IN NUMBER, nIS_HOSPITAL IN NUMBER,nIS_CAR_LOAN IN NUMBER,nAF_CAR_LOAN IN VARCHAR2, 
                                              nAF_APR_NO IN VARCHAR2, 
                                              strPUB_SYS IN VARCHAR2,
                                              strKEY_VALUE IN VARCHAR2,
                                              strCNTRTNO OUT VARCHAR2, strErrMsg OUT VARCHAR2) IS
                                              ...
                                              
```

### 接单

