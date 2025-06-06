USE [BIDoAn]
GO
/****** Object:  Schema [dns]    Script Date: 5/3/2025 7:47:22 PM ******/
CREATE SCHEMA [dns]
GO
/****** Object:  Schema [dw]    Script Date: 5/3/2025 7:47:22 PM ******/
CREATE SCHEMA [dw]
GO
/****** Object:  Schema [nds]    Script Date: 5/3/2025 7:47:22 PM ******/
CREATE SCHEMA [nds]
GO
/****** Object:  Schema [stg]    Script Date: 5/3/2025 7:47:22 PM ******/
CREATE SCHEMA [stg]
GO
/****** Object:  Table [dbo].[Dim_Date]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[Day] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Year] [smallint] NULL,
	[Quarter] [tinyint] NULL,
	[DayOfWeekName] [varchar](10) NULL,
	[IsWeekend] [bit] NULL,
	[WeekOfYear] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimDate]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NOT NULL,
	[Day] [tinyint] NULL,
	[Month] [tinyint] NULL,
	[Year] [smallint] NULL,
	[Quarter] [tinyint] NULL,
	[DayName] [varchar](10) NULL,
	[IsWeekend] [bit] NULL,
	[WeekOfYear] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimEmployee]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Active] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[DimShift]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[DimShift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftCode] [nvarchar](50) NULL,
	[ShiftName] [nvarchar](100) NULL,
	[Description] [nvarchar](255) NULL,
	[FromHours] [time](7) NULL,
	[ToHours] [time](7) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[FactDailyTask]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactDailyTask](
	[TaskId] [int] NOT NULL,
	[TaskName] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[Routine] [nvarchar](100) NULL,
	[Period] [nvarchar](100) NULL,
	[TaskDateKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[ShiftKey] [int] NULL,
	[Active] [int] NULL,
	[DateFrom] [datetime] NULL,
	[DateTo] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dw].[FactIncident]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[FactIncident](
	[IncidentId] [int] NOT NULL,
	[IncidentCode] [varchar](100) NULL,
	[IncidentName] [varchar](255) NULL,
	[ShortDescription] [varchar](255) NULL,
	[BusinessService] [varchar](100) NULL,
	[Priority] [varchar](50) NULL,
	[AssignmentGroup] [varchar](100) NULL,
	[AssignedToKey] [int] NULL,
	[ResolvedByKey] [int] NULL,
	[IncidentDateKey] [int] NULL,
	[ResolvedDate] [date] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [nds].[DailyTask]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [nds].[DailyTask](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
	[Routine] [nvarchar](100) NULL,
	[Period] [nvarchar](100) NULL,
	[TaskDateKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[ShiftKey] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[DailyTask]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[DailyTask](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](100) NULL,
	[Description] [nvarchar](4000) NULL,
	[Routine] [nvarchar](50) NULL,
	[Period] [nvarchar](50) NULL,
	[ShiftName] [nvarchar](50) NULL,
	[TaskDate] [date] NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Employee]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Active] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Incident]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Incident](
	[IncidentId] [int] IDENTITY(1,1) NOT NULL,
	[IncidentCode] [nvarchar](40) NULL,
	[IncidentName] [nvarchar](400) NULL,
	[ShortDescription] [nvarchar](4000) NULL,
	[BusinessService] [nvarchar](50) NULL,
	[Priority] [nvarchar](50) NULL,
	[AssignmentGroup] [nvarchar](50) NULL,
	[AssignedTo] [nvarchar](50) NULL,
	[SysCreatedOn] [nvarchar](50) NULL,
	[ResolvedBy] [nvarchar](50) NULL,
	[ResolvedDate] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [stg].[Shift]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [stg].[Shift](
	[ShiftId] [int] IDENTITY(1,1) NOT NULL,
	[ShiftCode] [nvarchar](50) NULL,
	[ShiftName] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[FromHours] [time](7) NULL,
	[ToHours] [time](7) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShiftId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dw].[DimEmployee] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dw].[DimEmployee] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [dw].[DimShift] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dw].[DimShift] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [dw].[FactDailyTask] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dw].[FactDailyTask] ADD  DEFAULT ('99990101') FOR [DateTo]
GO
ALTER TABLE [dw].[FactDailyTask] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dw].[FactDailyTask] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [nds].[DailyTask] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [nds].[DailyTask] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [stg].[DailyTask] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stg].[DailyTask] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [stg].[Employee] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stg].[Employee] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [stg].[Incident] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stg].[Incident] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [stg].[Shift] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [stg].[Shift] ADD  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
ALTER TABLE [dw].[FactIncident]  WITH CHECK ADD FOREIGN KEY([AssignedToKey])
REFERENCES [dw].[DimEmployee] ([EmployeeId])
GO
ALTER TABLE [dw].[FactIncident]  WITH CHECK ADD FOREIGN KEY([IncidentDateKey])
REFERENCES [dw].[DimDate] ([DateKey])
GO
ALTER TABLE [dw].[FactIncident]  WITH CHECK ADD FOREIGN KEY([ResolvedByKey])
REFERENCES [dw].[DimEmployee] ([EmployeeId])
GO
/****** Object:  StoredProcedure [dbo].[usp_etl_data]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[usp_etl_data] as

-- Chèn Dữ liệu vào Bảng DimEmployee (Từ stg.Employee)
-- Chúng ta giả sử rằng bảng stg.Employee chứa thông tin về nhân viên

INSERT INTO Dw.DimEmployee ( FullName, Email, Phone, Active)
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    Email,
    Phone,
    Active
FROM stg.Employee
WHERE NOT EXISTS (
    SELECT 1 FROM Dw.DimEmployee WHERE Email = stg.Employee.Email
);

-- Chèn Dữ liệu vào Bảng DimShift (Từ stg.Shift)
-- Chúng ta giả sử rằng bảng stg.Shift chứa thông tin về các ca làm việc


INSERT INTO Dw.DimShift ( ShiftCode, ShiftName, Description, FromHours, ToHours)
SELECT 
    ShiftCode,
    ShiftName,
    Description,
    FromHours,
    ToHours 
FROM stg.Shift
WHERE NOT EXISTS (
    SELECT 1 FROM Dw.DimShift WHERE ShiftCode = stg.Shift.ShiftCode
);

-- Chèn Dữ liệu vào Bảng FactDailyTask (Từ stg.DailyTask)
-- Chúng ta giả sử rằng bảng stg.DailyTask chứa thông tin về công việc hằng ngày

INSERT INTO Dw.FactDailyTask (TaskId, TaskName, Description, Routine, Period, TaskDateKey, EmployeeKey, ShiftKey)
SELECT 
    TaskId,
    TaskName,
    dt.Description,
    Routine,
    Period,
    CAST(DATEPART(YEAR, TaskDate) * 10000 + DATEPART(MONTH, TaskDate) * 100 + DATEPART(DAY, TaskDate) AS INT) AS TaskDateKey,
    EmployeeId AS EmployeeKey,
    ShiftId AS ShiftKey

FROM stg.DailyTask dt
LEFT JOIN STG.Employee emp ON  emp.LastName +' '+emp.MiddleName +' '+ emp.FirstName = dt.EmployeeName
left join stg.Shift st ON st.ShiftCode = dt.ShiftName
WHERE NOT EXISTS (
    SELECT 1 FROM Dw.FactDailyTask WHERE TaskId = dt.TaskId
);

-- Chèn Dữ liệu vào Bảng FactIncident (Từ stg.Incident)
-- Chúng ta giả sử rằng bảng stg.Incident chứa thông tin về sự cố

INSERT INTO Dw.FactIncident (IncidentId, IncidentCode, IncidentName, ShortDescription, BusinessService, Priority, AssignmentGroup, AssignedToKey, ResolvedByKey, IncidentDateKey, ResolvedDate)
SELECT 
    IncidentId,
    IncidentCode,
    IncidentName,
    ShortDescription,
    BusinessService,
    Priority,
    AssignmentGroup,
    emp.EmployeeId AS AssignedToKey,
    p.EmployeeId AS ResolvedByKey,
    CAST(DATEPART(YEAR, CONVERT(DATETIME,SysCreatedOn,103)) * 10000 + DATEPART(MONTH, CONVERT(DATETIME,SysCreatedOn,103)) * 100 + DATEPART(DAY, CONVERT(DATETIME,SysCreatedOn,103)) AS INT) AS IncidentDateKey,
    CONVERT(DATETIME,ResolvedDate,103)
	
FROM stg.Incident INC
LEFT JOIN [stg].[Employee]emp on inc.AssignedTo = emp.LastName +' '+emp.MiddleName +' '+ emp.FirstName
LEFT JOIN [stg].[Employee]p on inc.ResolvedBy = p.LastName +' '+p.MiddleName +' '+ p.FirstName
WHERE NOT EXISTS (
    SELECT 1 FROM Dw.FactIncident WHERE IncidentCode = inc.IncidentCode
);
GO
/****** Object:  StoredProcedure [dbo].[usp_etl_nds_processing]    Script Date: 5/3/2025 7:47:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_etl_nds_processing]
AS
BEGIN

    MERGE INTO [BIDoAn].[nds].[DailyTask] AS target
    USING 
	(SELECT dt.*
		 , CAST(DATEPART(YEAR, TaskDate) * 10000 + DATEPART(MONTH, TaskDate) * 100 + DATEPART(DAY, TaskDate) AS INT) AS TaskDateKey
		 , emp.employeeID as [EmployeeKey]
		 , st.Shiftcode as [ShiftKey]
	FROM [BIDoAn].[stg].[DailyTask] dt 
	LEFT JOIN [BIDoAn].[stg].Employee emp ON  emp.LastName +' '+emp.MiddleName +' '+ emp.FirstName = dt.EmployeeName
	left join stg.Shift st ON st.ShiftName = dt.ShiftName
	)
	
	AS source
    ON target.[TaskName] = source.[TaskName]

    WHEN MATCHED THEN
        UPDATE SET 
            target.[Description] = source.[Description],
            target.[Routine] = source.[Routine],
            target.[Period] = source.[Period],
            target.[TaskDateKey] = source.[TaskDateKey],
            target.[EmployeeKey] = source.[EmployeeKey],
            target.[ShiftKey] = source.[ShiftKey],
            target.[UpdatedDate] = GETDATE(),
            target.[UpdatedBy] = SYSTEM_USER

    WHEN NOT MATCHED BY TARGET THEN
        INSERT (

            [TaskName],
            [Description],
            [Routine],
            [Period],
            [TaskDateKey],
            [EmployeeKey],
            [ShiftKey],
            [CreatedDate],
            [CreatedBy],
            [UpdatedDate],
            [UpdatedBy]
        )
        VALUES (

            source.[TaskName],
            source.[Description],
            source.[Routine],
            source.[Period],
            source.[TaskDateKey],
            source.[EmployeeKey],
            source.[ShiftKey],
            GETDATE(),            -- CreatedDate
            SYSTEM_USER,         -- CreatedBy
            NULL,           -- UpdatedDate
            NULL          -- UpdatedBy
        )

    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;
END;
GO
