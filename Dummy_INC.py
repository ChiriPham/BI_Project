import csv
import random
from datetime import datetime, timedelta

# Cấu hình dữ liệu
incident_prefix = "INC"
inc_name = ["Refresh failed", 'Dataset Refresh Framework', "Access denied", "Unexpected null","Cannot access"]
systems = ["Power BI - Environment", "Power BI - Finance", "Power BI - Sales", "Power BI - HR", "UC4", "Infomatica", "Databrick", "Power Automate", "Power Center"]
priorities = ["1 - Critical", "2 - High", "3 - Moderate", "4 - Low"]
departments = ["Data Engineering Operations", "Business Intelligence", "IT Support","Finance Support", "Production Control", "DAEO"]

descriptions = [
    "Refresh failed: Enterprise BI Datasets workspace has failed to refresh.",
    "Dataset Refresh Framework: Failed to run the child flow.",
    "Data refresh timeout for Finance workspace.",
    "Flow error during scheduled dataset refresh.",
    "Cannot access the BI Report in Finance workspace.",
    "Failed to connect to data source in Sales Dashboard.",
    "Access denied error when refreshing BI report.",
    "Dataset refresh ran longer than expected.",
    "Unexpected null values in BI dataset."
]
names = [
    "Tran Van Dung", "Le Thu Huong", "Pham Quang Tu", "Vu Minh Long", "Ha Thai Nam",
    "Do Hong Mai", "Nguyen Nhat Linh", "Cao Ngoc Ha", "Le Mai Nhung", "Ho Ba Kien", "Vo Ha My"
]

# Tạo khoảng thời gian
start_date = datetime(2023, 1, 1)
end_date = datetime(2025, 12, 31)
date_range = (end_date - start_date).days

# Tạo 10.000 dòng dữ liệu giả
rows = []
for i in range(10000):
    incident_id = f"{incident_prefix}{6657000 + i}"
    name = random.choice(inc_name)
    description = random.choice(descriptions)
    system = random.choice(systems)
    priority = random.choice(priorities)
    department = random.choice(departments)
    created_by = random.choice(names)
    created_time = start_date + timedelta(minutes=random.randint(0, date_range * 24 * 60))
    updated_by = random.choice(names)
    updated_time = created_time + timedelta(minutes=random.randint(0, 60))
    
    rows.append([
        incident_id,
        name,
        description,
        system,
        priority,
        department,
        created_by,
        created_time.strftime("%d/%m/%Y %H:%M"),
        updated_by,
        updated_time.strftime("%d/%m/%Y %H:%M")
    ])

# Ghi ra file CSV
filename = "dummy_powerbi_incidents_10000.csv"
with open(filename, mode="w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow([
        "Incident ID", "Description", "System", "Priority",
        "Department", "Created By", "Created Time",
        "Updated By", "Updated Time"
    ])
    writer.writerows(rows)

print(f"Đã tạo file: {filename}")
