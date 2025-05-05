import pandas as pd
import random
from datetime import datetime, timedelta

# Danh sách mẫu
task_names = [
    "Sales", "Restart server", "Perform Cognos daily", "Paris report",
    "Backup database", "ETL job check", "Send daily email", "BI Dashboard check", "Check Disk Space","Test Failover Cluster","Load Data Warehouse","Sync CRM Data","Send Daily Email"
    ,"Notify Team on Slack","Generate Forecast Report","Update Sales Pipeline","Analyze Customer Feedback"
]
members = ["Tran Van Dung", "Le Thu Huong", "Pham Quang Tu", "Vu Minh Long", "Ha Thai Nam", "Do Hong Mai", "Nguyen Nhat Linh", "Cao Ngoc Ha", "Le Mai Nhung", "Ho Ba Kien", "Vo Ha My"]
shifts = ["Shift 1", "Shift 2", "Shift 3"]
routine = ["Daily", "Weekly", "Monthly"]
start_date = datetime(2023, 12, 1)


start_date = datetime(2023, 1, 1)
end_date = datetime(2025, 12, 31)
date_range = (end_date - start_date).days

# Tạo 10,000 dòng dữ liệu
records = []
for i in range(1, 200001):
    task_no = 'Task' + str(i)
    task = random.choice(task_names)
    pst_time = "12:00 PM"
    vn_time = "2:00 AM"
    routine_type = random.choice(routine)
    period = random.randint(1, 12) if routine_type == "Monthly" else None
    shift = random.choice(shifts)
    date = start_date + timedelta(days=random.randint(0, date_range))
    member = random.choice(members)

    records.append([task_no, task, pst_time, vn_time, routine_type, period, shift, date, member])

# Tạo DataFrame và lưu file CSV
df = pd.DataFrame(records, columns=[
    "Task No", "Tasks Name", "PST Time", "VN Time", "Routine",
    "Period", "Shift", "Date", "Member"
])

df.to_csv("dummy_tasks_10000.csv", index=False)
print("✅ File 'dummy_tasks_10000.csv' đã được tạo.")