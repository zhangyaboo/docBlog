

## Oracle 常用语法

这个Oracle SQL语句片段使用了窗口函数`MAX()`和`DENSE_RANK()`，以及`OVER`和`PARTITION BY`子句来计算分区内某个字段的最大值，同时使用`CASE`表达式来动态地选择分区键。这个查询适用于需要在特定条件下对数据进行分组并计算每组内某个字段的最大值的场景。

### 关键词解释

1. **MAX()**: 是一个聚合函数，用于返回一组值中的最大值。 2. **DENSE_RANK()**: 是一个窗口函数，用于为分区内的行分配排名，排名会根据`ORDER BY`子句中的顺序进行。与`RANK()`函数不同，`DENSE_RANK()`在相同排名的情况下不会跳过接下来的排名。 3. **OVER**: 是一个子句，用于定义窗口函数的计算范围和顺序。 4. **PARTITION BY**: 用于将查询结果集分为多个分区，每个分区内的数据是独立的。 5. **CASE**: 是一个条件表达式，用于基于条件返回不同的值。

### 示例场景

假设我们有一个在线教育平台，其中有两个表：`Courses`和`Enrollments`。`Courses`表存储课程信息，包括课程ID(`courseId`)和课程语言(`language`)。`Enrollments`表存储学生的选课信息，包括选课ID(`enrollmentId`)、课程ID(`courseId`)、学生ID(`studentId`)和选课日期(`enrollmentDate`)。 我们想要查询每种语言课程中最先被选修的课程的选课日期，如果有多门课程同时被选修，则返回选课日期最早的课程。

#### 建表语句

```sql
CREATE TABLE Courses (
    courseId NUMBER PRIMARY KEY,
    courseName VARCHAR2(100),
    language VARCHAR2(50)
);
CREATE TABLE Enrollments (
    enrollmentId NUMBER PRIMARY KEY,
    courseId NUMBER,
    studentId NUMBER,
    enrollmentDate DATE,
    FOREIGN KEY (courseId) REFERENCES Courses(courseId)
);
```

#### 测试数据

```sql
-- Courses表数据
INSERT INTO Courses (courseId, courseName, language) VALUES (1, 'Course A', 'English');
INSERT INTO Courses (courseId, courseName, language) VALUES (2, 'Course B', 'Chinese');
INSERT INTO Courses (courseId, courseName, language) VALUES (3, 'Course C', 'English');
-- Enrollments表数据
INSERT INTO Enrollments (enrollmentId, courseId, studentId, enrollmentDate) VALUES (1, 1, 1, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
INSERT INTO Enrollments (enrollmentId, courseId, studentId, enrollmentDate) VALUES (2, 2, 2, TO_DATE('2023-01-02', 'YYYY-MM-DD'));
INSERT INTO Enrollments (enrollmentId, courseId, studentId, enrollmentDate) VALUES (3, 3, 3, TO_DATE('2023-01-01', 'YYYY-MM-DD'));
```

#### 演示语句

```sql
SELECT
    Courses.language,
    MAX(Enrollments.enrollmentDate) KEEP (DENSE_RANK FIRST ORDER BY Enrollments.enrollmentDate)
    OVER (PARTITION BY Courses.language) AS firstEnrollmentDate
FROM
    Courses
JOIN
    Enrollments ON Courses.courseId = Enrollments.courseId;
```

#### 预期结果

这个查询会返回每种语言(`language`)的课程中最先被选修的课程的选课日期(`firstEnrollmentDate`)。如果有多个课程在同一天被选修，`DENSE_RANK`函数会确保所有这些课程都被考虑在内，并且`MAX()`函数会返回最早的选课日期。 请注意，具体的执行结果将依赖于你提供的测试数据和实际表结构。这个示例展示了如何在多条件分组和排序的场景下使用窗口函数来获取所需的数据。



### DECODE

```
DECODE(LAM.asqlx, '1', LALI.akhxm, '2', LALI.aQymc2, '') AS akhxm,
       LALI.asjhm,
       CASE LAM.asqlx
           WHEN '1' THEN LALI.azjhm
           WHEN '2' THEN LALI.AZZJGDM
           ELSE ''
           END                                                  as azjhm,
```
