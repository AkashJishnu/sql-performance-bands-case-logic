# 🎓 SQL Performance Bands — CASE Logic Project

This project showcases SQL logic using `CASE` expressions to categorize students by marks, assign grades, and evaluate scholarship eligibility.

---

## 📊 Tables Used

### `students`

| name   | marks | department_id |
|--------|-------|----------------|
| Akash  | 95    | 1              |
| Priya  | 81    | 2              |
| Meera  | 65    | NULL           |
| Rahul  | 49    | 1              |
| Daniel | 73    | 3              |

### `departments`

| department_id | department_name     |
|----------------|---------------------|
| 1              | Computer Science    |
| 2              | Physics             |
| 3              | Literature          |
| 4              | Business            |

---

## 🧠 Tasks Covered

- ✅ Pass/Fail evaluation (`CASE`)
- ✅ Letter grading (A–F)
- ✅ Department-based labels (`Tech`, `Sci`, etc.)
- ✅ Performance label (`Topper`, `Performer`, `Improver`)
- ✅ Custom ordering using `CASE in ORDER BY`
- ✅ Count students in each performance band (`GROUP BY + CASE`)
- ✅ Multiple `CASE` columns in one query (grade, result, verdict)
- ✅ Aggregated conditional counts with `SUM(CASE WHEN ...)`
- ✅ Nested `CASE` logic for scholarship assignment

---

## 📂 Files

- `case_queries.sql` — all query logic (well-commented)
- `sample_data.sql` — create and populate tables (optional)

---

## 🚀 Outcome

This mini-project demonstrates how SQL analysts apply `CASE` logic to derive insights, assign categories, and drive data-driven decisions from raw numerical data.


