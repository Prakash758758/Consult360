USE [Consult360]
GO
/****** Object:  StoredProcedure [dbo].[USP_ValidatePhoneNumber]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[USP_ValidatePhoneNumber]
GO
/****** Object:  StoredProcedure [dbo].[Get_SampleSp]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_SampleSp]
GO
/****** Object:  StoredProcedure [dbo].[Get_PortalUser_Details]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_PortalUser_Details]
GO
/****** Object:  StoredProcedure [dbo].[Get_Patient_Details]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_Patient_Details]
GO
/****** Object:  StoredProcedure [dbo].[Get_OTPValidated]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_OTPValidated]
GO
/****** Object:  StoredProcedure [dbo].[Get_EmailforPhone]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_EmailforPhone]
GO
/****** Object:  StoredProcedure [dbo].[Get_Doctor_Details]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Get_Doctor_Details]
GO
/****** Object:  StoredProcedure [dbo].[Create_OTP]    Script Date: 06-04-2022 12:07:58 ******/
DROP PROCEDURE IF EXISTS [dbo].[Create_OTP]
GO
/****** Object:  Table [dbo].[UserLoginOTP]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[UserLoginOTP]
GO
/****** Object:  Table [dbo].[Practice]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[Practice]
GO
/****** Object:  Table [dbo].[PortalUserRole]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[PortalUserRole]
GO
/****** Object:  Table [dbo].[PortalUser]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[PortalUser]
GO
/****** Object:  Table [dbo].[PatientProxy]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[PatientProxy]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[Patient]
GO
/****** Object:  Table [dbo].[MeetingRoom]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[MeetingRoom]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[Doctor]
GO
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[AppointmentStatus]
GO
/****** Object:  Table [dbo].[AppointmentDetails]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[AppointmentDetails]
GO
/****** Object:  Table [dbo].[AppointmentCheckIn]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[AppointmentCheckIn]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 06-04-2022 12:07:58 ******/
DROP TABLE IF EXISTS [dbo].[Appointment]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Appointment_Id] [uniqueidentifier] NOT NULL,
	[Practice_ID] [uniqueidentifier] NOT NULL,
	[Doctor_ID] [uniqueidentifier] NOT NULL,
	[Patient_ID] [uniqueidentifier] NOT NULL,
	[AppointmentStatus_ID] [uniqueidentifier] NOT NULL,
	[Appointment_DateTime] [datetime2](7) NOT NULL,
	[Appointment_Code] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Appointment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentCheckIn]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentCheckIn](
	[AppointmentCheckIn_Id] [uniqueidentifier] NOT NULL,
	[Appointment_Id] [uniqueidentifier] NOT NULL,
	[Practice_Id] [uniqueidentifier] NOT NULL,
	[Doctor_Id] [uniqueidentifier] NOT NULL,
	[Patient_Id] [uniqueidentifier] NOT NULL,
	[Patient_CheckIn] [datetime2](7) NOT NULL,
	[Patient_CheckOut] [datetime2](7) NOT NULL,
	[Doctor_CheckIn] [datetime2](7) NOT NULL,
	[Doctor_CheckOut] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AppointmentCheckIn] PRIMARY KEY CLUSTERED 
(
	[AppointmentCheckIn_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentDetails]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentDetails](
	[AppointmentDetails_Id] [uniqueidentifier] NOT NULL,
	[Appointment_Id] [uniqueidentifier] NOT NULL,
	[AppointmentDetails_DocumentName] [nvarchar](255) NULL,
	[AppointmentDetails_DocumentLocation] [nvarchar](max) NULL,
	[AppointmentDetails_PatientNotes] [nvarchar](max) NULL,
	[AppointmentDetails_DoctorNotes] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AppointmentDetails] PRIMARY KEY CLUSTERED 
(
	[AppointmentDetails_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppointmentStatus]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentStatus](
	[AppointmentStatus_Id] [uniqueidentifier] NOT NULL,
	[AppointmentStatus_Type] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ApointmentStatus_Type] PRIMARY KEY CLUSTERED 
(
	[AppointmentStatus_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Doctor_Id] [uniqueidentifier] NOT NULL,
	[PortalUser_Id] [uniqueidentifier] NOT NULL,
	[Practice_ID] [uniqueidentifier] NOT NULL,
	[Doctor_Openhour] [datetime2](7) NOT NULL,
	[Doctor_Closehour] [datetime2](7) NOT NULL,
	[Doctor_Description] [nvarchar](max) NULL,
	[Doctor_Specialisation] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Doctor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeetingRoom]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetingRoom](
	[MeetingRoom_Id] [uniqueidentifier] NOT NULL,
	[Appointment_Id] [uniqueidentifier] NOT NULL,
	[Practice_Id] [uniqueidentifier] NOT NULL,
	[MeetingRoom_Detail] [nvarchar](255) NULL,
	[MeetingRoom_URL] [nvarchar](255) NULL,
	[MeetingRoom_Code] [nvarchar](255) NULL,
	[MeetingRoom_Timeout] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_MeetingRoom] PRIMARY KEY CLUSTERED 
(
	[MeetingRoom_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Patient_Id] [uniqueidentifier] NOT NULL,
	[PortalUser_Id] [uniqueidentifier] NOT NULL,
	[Practice_ID] [uniqueidentifier] NOT NULL,
	[Patient_NHSNumber] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Patient_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientProxy]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientProxy](
	[PatientProxy_Id] [uniqueidentifier] NOT NULL,
	[Patient_ID] [uniqueidentifier] NOT NULL,
	[PatientProxy_FirstName] [nvarchar](255) NULL,
	[PatientProxy_LastName] [nvarchar](255) NULL,
	[PatientProxy_Address1] [nvarchar](255) NULL,
	[PatientProxy_Address2] [nvarchar](255) NULL,
	[PatientProxy_Postcode] [nvarchar](255) NULL,
	[PatientProxy_Phone] [nvarchar](255) NULL,
	[PatientProxy_EmailID] [nvarchar](255) NULL,
	[Practice_ID] [uniqueidentifier] NOT NULL,
	[PatientProxy_Image] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PatientProxy] PRIMARY KEY CLUSTERED 
(
	[PatientProxy_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortalUser]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortalUser](
	[PortalUser_Id] [uniqueidentifier] NOT NULL,
	[Practice_ID] [uniqueidentifier] NOT NULL,
	[PortalUser_FirstName] [nvarchar](255) NULL,
	[PortalUser_LastName] [nvarchar](255) NULL,
	[PortalUser_Address1] [nvarchar](255) NULL,
	[PortalUser_Address2] [nvarchar](255) NULL,
	[PortalUser_Postcode] [nvarchar](255) NULL,
	[PortalUser_Phone] [nvarchar](255) NULL,
	[PortalUser_EmailID] [nvarchar](255) NULL,
	[PortalUser_Image] [nvarchar](max) NULL,
	[PortalUserRole_Id] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PortalUser] PRIMARY KEY CLUSTERED 
(
	[PortalUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortalUserRole]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortalUserRole](
	[PortalUserRole_Id] [uniqueidentifier] NOT NULL,
	[PortalUserRole_Name] [nvarchar](255) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_PortalUserRole] PRIMARY KEY CLUSTERED 
(
	[PortalUserRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Practice]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Practice](
	[Practice_Id] [uniqueidentifier] NOT NULL,
	[Practice_Name] [nvarchar](255) NULL,
	[Practice_Address1] [nvarchar](255) NULL,
	[Practice_Address2] [nvarchar](255) NULL,
	[Practice_Postcode] [nvarchar](255) NULL,
	[Practice_Phone] [nvarchar](255) NULL,
	[Practice_EmailID] [nvarchar](255) NULL,
	[Practice_Openhour] [datetime2](7) NULL,
	[PracticeClosehour] [datetime2](7) NULL,
	[Practice_Description] [nvarchar](max) NULL,
	[Practice_Website] [nvarchar](255) NULL,
	[Practice_Meeting_Timeout] [int] NULL,
	[Practice_email_Frequency] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Practice] PRIMARY KEY CLUSTERED 
(
	[Practice_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginOTP]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginOTP](
	[UserLoginOTP_Id] [uniqueidentifier] NOT NULL,
	[UserLoginOTP_Detail] [nvarchar](255) NULL,
	[PortalUser_Id] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ModifiedBy] [uniqueidentifier] NULL,
	[ModifiedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserLoginOTP] PRIMARY KEY CLUSTERED 
(
	[UserLoginOTP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Doctor] ([Doctor_Id], [PortalUser_Id], [Practice_ID], [Doctor_Openhour], [Doctor_Closehour], [Doctor_Description], [Doctor_Specialisation], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'995e64ad-521d-4d89-a43d-479f3b61d7e8', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', N'896358f7-2012-4707-a916-291fc1a9aeec', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'a general practitioner (GP) is a medical doctor who treats acute and chronic illnesses and provides preventive care', N'GP', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8333333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8333333' AS DateTime2))
INSERT [dbo].[Doctor] ([Doctor_Id], [PortalUser_Id], [Practice_ID], [Doctor_Openhour], [Doctor_Closehour], [Doctor_Description], [Doctor_Specialisation], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'169324bc-62ff-45d5-b498-a97dc19f55bc', N'6db87c5f-9039-498a-a5a0-9d1a449117d4', N'f78e7c23-6350-4c57-8f35-c69df4937c6b', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'In modern medicine, a surgeon is a medical professional who performs surgery', N'Surgeon', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8433333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8433333' AS DateTime2))
INSERT [dbo].[Doctor] ([Doctor_Id], [PortalUser_Id], [Practice_ID], [Doctor_Openhour], [Doctor_Closehour], [Doctor_Description], [Doctor_Specialisation], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'b73c8898-e7ef-4f77-997f-aa4587c7d1c8', N'568635a0-271a-41bf-894c-dd0e46fee351', N'23beb413-1bfb-452b-8ada-eaa156117f7c', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'a general practitioner (GP) is a medical doctor who treats acute and chronic illnesses and provides preventive care', N'GP', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8466667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8466667' AS DateTime2))
INSERT [dbo].[Doctor] ([Doctor_Id], [PortalUser_Id], [Practice_ID], [Doctor_Openhour], [Doctor_Closehour], [Doctor_Description], [Doctor_Specialisation], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'ca4db420-c796-4b6f-b30f-abad4cf8ec39', N'5a77a365-bb8f-4eb0-9e76-17a37d5feebe', N'f9b2013c-23a8-460e-a225-a43d4f1fc7b9', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'A pediatrician is a medical doctor who manages the physical, behavioral, and mental care for children from birth until age 18', N'Pediatrician', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8400000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:54:45.8400000' AS DateTime2))
GO
INSERT [dbo].[Patient] ([Patient_Id], [PortalUser_Id], [Practice_ID], [Patient_NHSNumber], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'534e4f2d-b3e5-4355-bf68-149653778cee', N'6776deea-94b9-4465-8213-b86790a2273d', N'f78e7c23-6350-4c57-8f35-c69df4937c6b', N'5489674581', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9600000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9600000' AS DateTime2))
INSERT [dbo].[Patient] ([Patient_Id], [PortalUser_Id], [Practice_ID], [Patient_NHSNumber], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'1fc2bce3-f319-49f4-aff5-ec1b60ea4894', N'5b62e086-569d-4c80-808f-59647969e9b3', N'f9b2013c-23a8-460e-a225-a43d4f1fc7b9', N'3654874598', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9566667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9566667' AS DateTime2))
INSERT [dbo].[Patient] ([Patient_Id], [PortalUser_Id], [Practice_ID], [Patient_NHSNumber], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c9f266a8-2708-4d99-8664-f5930d101239', N'8b05ee83-c12f-4d9d-bd73-4a6fd1d3affd', N'896358f7-2012-4707-a916-291fc1a9aeec', N'7892546879', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9500000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9500000' AS DateTime2))
INSERT [dbo].[Patient] ([Patient_Id], [PortalUser_Id], [Practice_ID], [Patient_NHSNumber], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'1c587af7-ea9f-47bd-b9cb-fe795ca3c26b', N'c2094348-7566-4bfa-8351-bb4991fbe082', N'23beb413-1bfb-452b-8ada-eaa156117f7c', N'2547893254', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9600000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T16:59:32.9600000' AS DateTime2))
GO
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'26a7a31d-6871-4281-aa7f-0343a74ccf73', N'896358f7-2012-4707-a916-291fc1a9aeec', N'Abay_Gillman', N'Kurnal', N'9 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689822018', N'Abay_Gillman@yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2733333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2733333' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'5a77a365-bb8f-4eb0-9e76-17a37d5feebe', N'23beb413-1bfb-452b-8ada-eaa156117f7c', N'Bhavya_Highland', N'Prasad', N'36 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689822023', N'Bhavya_Highland@Yopmail.com', N'No Image', N'1f4de7a2-849e-423d-9a68-9161f843cc6e', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2833333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2833333' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'8b05ee83-c12f-4d9d-bd73-4a6fd1d3affd', N'23beb413-1bfb-452b-8ada-eaa156117f7c', N'PUFName_Highland', N'PULastName', N'36 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689822022', N'PUFName_Highland@Yopmail.com', N'No Image', N'89fc84e4-dc13-4c97-b116-34e2f735d710', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2700000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2700000' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'5b62e086-569d-4c80-808f-59647969e9b3', N'f78e7c23-6350-4c57-8f35-c69df4937c6b', N'PUFName_Knoll', N'PULastName', N'27 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689850231', N'PUFName_Knoll@Yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2700000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2700000' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'6db87c5f-9039-498a-a5a0-9d1a449117d4', N'f9b2013c-23a8-460e-a225-a43d4f1fc7b9', N'Vishwa_FamilySurgery', N'Rao', N'18 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689666801', N'Vishwa__FamilySurgery@yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2766667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2766667' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'6776deea-94b9-4465-8213-b86790a2273d', N'f9b2013c-23a8-460e-a225-a43d4f1fc7b9', N'PUFName_FamilySurgery', N'PULastName', N'18 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689666800', N'PUFName__FamilySurgery@yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2666667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2666667' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c2094348-7566-4bfa-8351-bb4991fbe082', N'896358f7-2012-4707-a916-291fc1a9aeec', N'PUFName_Gillman', N'PULastName', N'9 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689822017', N'PUFName_Gillman@yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2600000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2600000' AS DateTime2))
INSERT [dbo].[PortalUser] ([PortalUser_Id], [Practice_ID], [PortalUser_FirstName], [PortalUser_LastName], [PortalUser_Address1], [PortalUser_Address2], [PortalUser_Postcode], [PortalUser_Phone], [PortalUser_EmailID], [PortalUser_Image], [PortalUserRole_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'568635a0-271a-41bf-894c-dd0e46fee351', N'f78e7c23-6350-4c57-8f35-c69df4937c6b', N'Vishnu_Knoll', N'Bapu', N'27 Sevenoaks Road', N'Orpington', N'BR68JY', N'01689850232', N'Vishnu_Knoll@Yopmail.com', N'No Image', N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2800000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T14:06:03.2800000' AS DateTime2))
GO
INSERT [dbo].[PortalUserRole] ([PortalUserRole_Id], [PortalUserRole_Name], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'8828ace0-e9e0-4dc8-b3e9-244f40b525bf', N'Patient', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7700000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7700000' AS DateTime2))
INSERT [dbo].[PortalUserRole] ([PortalUserRole_Id], [PortalUserRole_Name], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'89fc84e4-dc13-4c97-b116-34e2f735d710', N'PoralAdmin', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7633333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7633333' AS DateTime2))
INSERT [dbo].[PortalUserRole] ([PortalUserRole_Id], [PortalUserRole_Name], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'9ebf572e-6b36-428c-9bfe-54f48822de6c', N'PracticeAdmin', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7733333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7733333' AS DateTime2))
INSERT [dbo].[PortalUserRole] ([PortalUserRole_Id], [PortalUserRole_Name], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'1f4de7a2-849e-423d-9a68-9161f843cc6e', N'Doctor', 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7666667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:30:52.7666667' AS DateTime2))
GO
INSERT [dbo].[Practice] ([Practice_Id], [Practice_Name], [Practice_Address1], [Practice_Address2], [Practice_Postcode], [Practice_Phone], [Practice_EmailID], [Practice_Openhour], [PracticeClosehour], [Practice_Description], [Practice_Website], [Practice_Meeting_Timeout], [Practice_email_Frequency], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'896358f7-2012-4707-a916-291fc1a9aeec', N'Gillmans Road Surgery', N'1 Gillmans Rd', N'Orpington', N'BR5 4LA', N'01689 822022', N'connect@gillmans.co.uk', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'About Gillmans road surgery', N'https://gillmans.co.uk', 30, 30, 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6200000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6200000' AS DateTime2))
INSERT [dbo].[Practice] ([Practice_Id], [Practice_Name], [Practice_Address1], [Practice_Address2], [Practice_Postcode], [Practice_Phone], [Practice_EmailID], [Practice_Openhour], [PracticeClosehour], [Practice_Description], [Practice_Website], [Practice_Meeting_Timeout], [Practice_email_Frequency], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'f9b2013c-23a8-460e-a225-a43d4f1fc7b9', N'The Family Surgery', N'7 High St', N'Green Street Green, Orpington', N'BR6 6BG', N'01689 850231', N'info@familysurgery.co.uk', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'The Family Surgery is a GP Surgery, licenced to practice within the Bromley borough of the United Kingdom.', N'https://thefamilysurgeryorpington.nhs.uk/', 30, 30, 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6166667' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6166667' AS DateTime2))
INSERT [dbo].[Practice] ([Practice_Id], [Practice_Name], [Practice_Address1], [Practice_Address2], [Practice_Postcode], [Practice_Phone], [Practice_EmailID], [Practice_Openhour], [PracticeClosehour], [Practice_Description], [Practice_Website], [Practice_Meeting_Timeout], [Practice_email_Frequency], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'f78e7c23-6350-4c57-8f35-c69df4937c6b', N'Knoll Medical Practice', N'19 Homefield Rise', N'Orpington', N'BR6 0FE', N'01689 666800', N'reception@knollmedical.co.uk', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'From the 1st Oct 2022, there will be an enhanced offering of weekend appointments provided through the Orpington primary care network (PCN). Further details on this will be announced in due course', N'https://knollmedicalpractice.co.uk/', 30, 30, 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6133333' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6133333' AS DateTime2))
INSERT [dbo].[Practice] ([Practice_Id], [Practice_Name], [Practice_Address1], [Practice_Address2], [Practice_Postcode], [Practice_Phone], [Practice_EmailID], [Practice_Openhour], [PracticeClosehour], [Practice_Description], [Practice_Website], [Practice_Meeting_Timeout], [Practice_email_Frequency], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'23beb413-1bfb-452b-8ada-eaa156117f7c', N'Highland Medical Practice - Orpington Surgery', N'59 Sevenoaks Rd', N'Orpington', N'BR6 9JN', N'01689 822017', N'Contact@highland.co.uk', CAST(N'1900-01-01T08:00:00.0000000' AS DateTime2), CAST(N'1900-01-01T20:00:00.0000000' AS DateTime2), N'We have now moved our Orpington GP Surgery to 59 Sevenoaks Road (former Charterhouse Surgery premises).', N'https://www.highlandmedicalpractice.co.uk/', 30, 30, 1, N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6100000' AS DateTime2), N'c9037ab5-d557-4afa-98de-cc6d3d59c6f4', CAST(N'2022-03-31T12:21:36.6100000' AS DateTime2))
GO
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'bd0a57f3-ca0a-4d9a-a1f9-350e19283a80', N'5504', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:10:17.4900000' AS DateTime2), NULL, CAST(N'2022-04-05T21:10:17.4900000' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'751c163b-2856-4c49-bc54-37b0af62fc00', N'6637', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:17:37.5800000' AS DateTime2), NULL, CAST(N'2022-04-05T21:17:37.5800000' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'00c47c49-9b22-4221-9bba-45ab4dd91b59', N'3544', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 0, NULL, CAST(N'2022-04-05T21:07:05.8166667' AS DateTime2), NULL, CAST(N'2022-04-05T21:07:05.8166667' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'c203158a-0ca4-4950-bc9d-46710cde264a', N'0709', N'8b05ee83-c12f-4d9d-bd73-4a6fd1d3affd', 1, NULL, CAST(N'2022-04-05T21:45:58.7566667' AS DateTime2), NULL, CAST(N'2022-04-05T21:45:58.7566667' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'd831a301-d682-496b-92eb-7249013392f1', N'4076', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:14:15.3333333' AS DateTime2), NULL, CAST(N'2022-04-05T21:14:15.3333333' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'e589c991-0b07-4290-bfbc-b67a64fe40e6', N'8632', N'5a77a365-bb8f-4eb0-9e76-17a37d5feebe', 1, NULL, CAST(N'2022-04-05T21:46:15.1166667' AS DateTime2), NULL, CAST(N'2022-04-05T21:46:15.1166667' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'b38d59d0-3f36-4f81-a4b3-b98373e3748b', N'4628', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:14:59.5966667' AS DateTime2), NULL, CAST(N'2022-04-05T21:14:59.5966667' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'fbb8fc04-ada4-4327-a65a-bf011453be9a', N'2117', N'8b05ee83-c12f-4d9d-bd73-4a6fd1d3affd', 0, NULL, CAST(N'2022-04-05T21:43:09.6633333' AS DateTime2), NULL, CAST(N'2022-04-05T21:43:09.6633333' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'99416c5d-c0bf-4108-b0a7-c1e194f9fdb5', N'9310', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:46:32.9466667' AS DateTime2), NULL, CAST(N'2022-04-05T21:46:32.9466667' AS DateTime2))
INSERT [dbo].[UserLoginOTP] ([UserLoginOTP_Id], [UserLoginOTP_Detail], [PortalUser_Id], [IsActive], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (N'3abf3f5d-c27c-4968-8231-d3060f72e3ce', N'7552', N'26a7a31d-6871-4281-aa7f-0343a74ccf73', 1, NULL, CAST(N'2022-04-05T21:12:04.3566667' AS DateTime2), NULL, CAST(N'2022-04-05T21:12:04.3566667' AS DateTime2))
GO
/****** Object:  StoredProcedure [dbo].[Create_OTP]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Badarinatha>
-- Create Date: <31 Mar 2022>
-- Description: <Procedure to insert OTP in the table. The procedure will check if an OTP for requested UserID exists. if Active, it will de-activate and re-insert new record >
-- =============================================
CREATE PROCEDURE [dbo].[Create_OTP]
(

    @PhoneNumber varchar(20),
	@P_UserLoginOTP_Details VarChar(100),
	@P_CreatedBy UniqueIdentifier=null
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	Declare @Exists bit = 0
	Declare @P_PortalUser_Id uniqueidentifier=(select PortalUser_Id from PortalUser where PortalUser_Phone like '%'+@PhoneNumber+'%' and IsActive=1)

	Select @Exists = IIF(IsActive = '1','1','0') From [dbo].[UserLoginOTP] 
	Where [PortalUser_Id] = @P_PortalUser_Id Order by ModifiedDate Desc

	If @Exists = 1
		Update [dbo].[UserLoginOTP] Set IsActive = '0' Where  [PortalUser_Id] = @P_PortalUser_Id


    -- Insert statements for procedure here
    INSERT INTO [dbo].[UserLoginOTP]([UserLoginOTP_Id],[UserLoginOTP_Detail],[PortalUser_Id],[IsActive],[CreatedBy],[CreatedDate],[ModifiedBy],[ModifiedDate]) 
      VALUES (NEWID(),@P_UserLoginOTP_Details,@P_PortalUser_Id,'1',@P_CreatedBy,GetDate(),@P_CreatedBy,GetDate())

	  select 'success' As StatusMessage, 1 as StatusCode
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Doctor_Details]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Badarinatha
-- Create Date: 31 Mar 2022
-- Description: Get doctor details
-- =============================================
CREATE PROCEDURE [dbo].[Get_Doctor_Details] 
(
    -- Add the parameters for the stored procedure here
    @P_PortalUser_ID UniqueIdentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    Select PU.PortalUser_FirstName,PU.PortalUser_LastName,DR.Doctor_Specialisation From PortalUser PU, Doctor DR where PU.PortalUser_Id = DR.PortalUser_Id And PU.PortalUser_Id = @P_PortalUser_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Get_EmailforPhone]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Badarinatha>
-- Create Date: <31 Mar 2022>
-- Description: <Procedure will validate the given phone number and returns valid email if the record exists>
-- =============================================
CREATE PROCEDURE [dbo].[Get_EmailforPhone]
(
    -- Add the parameters for the stored procedure here
    @PhoneNo VarChar(255)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    Select PortalUser_EmailID,IIF(PortalUser_EmailID != NULL,'0','1') as 'Exists' From [PortalUser] where portalUser_Phone = @PhoneNo
END
GO
/****** Object:  StoredProcedure [dbo].[Get_OTPValidated]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Badarinatha>
-- Create Date: <31 Mar 2022>
-- Description: <Procedure to validate if the user has entered the correct and valid OTP >
-- =============================================
CREATE PROCEDURE [dbo].[Get_OTPValidated]
(
    -- Add the parameters for the stored procedure here
	@PhoneNumber varchar(20)
    ,@P_PortalUser_Id UniqueIdentifier=null,
	@P_UserLoginOTP_Details VarChar(100)
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON
	Declare @Valid bit = 0
	set @P_PortalUser_Id=(select PortalUser_Id from PortalUser where PortalUser_Phone=@PhoneNumber and IsActive=1)
	Select @Valid = IsActive From [dbo].[UserLoginOTP] Where 
	[PortalUser_Id] = @P_PortalUser_Id and UserLoginOTP_Detail = @P_UserLoginOTP_Details And IsActive = '1'
	Order by ModifiedDate Desc

	Select @Valid as Valid
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Patient_Details]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Badarinatha
-- Create Date: 31 Mar 2022
-- Description: Get Patient details
-- =============================================
CREATE PROCEDURE [dbo].[Get_Patient_Details] 
(
    -- Add the parameters for the stored procedure here
    @P_PortalUser_ID UniqueIdentifier
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    Select PU.PortalUser_FirstName,PU.PortalUser_LastName,PT.Patient_NHSNumber From PortalUser PU, Patient PT where PU.PortalUser_Id = PT.PortalUser_Id And PU.PortalUser_Id = @P_PortalUser_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Get_PortalUser_Details]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Badarinatha
-- Create Date: 31 Mar 2022
-- Description: Get Portal User details
-- =============================================
CREATE PROCEDURE [dbo].[Get_PortalUser_Details] 
(
    -- Add the parameters for the stored procedure here
    @P_PortalUser_ID UniqueIdentifier=null
	,@PhoneNumber varchar(20)
)
AS
BEGIN
    
    SET NOCOUNT ON
	set @P_PortalUser_ID=(select PortalUser_Id from PortalUser where PortalUser_Phone=@PhoneNumber and IsActive=1)
    -- Insert statements for procedure here
    Select PU.PortalUser_FirstName,PU.PortalUser_LastName,PR.Practice_Name,CAST(PR.Practice_Id AS varchar(36)) AS Practice_Id,PUR.PortalUserRole_Name
	From PortalUser PU
	LEFT JOIN Practice PR ON PR.Practice_Id=PU.Practice_ID
	left join PortalUserRole  PUR on PUR.PortalUserRole_Id=PU.PortalUserRole_Id
	where PU.Practice_ID = PR.Practice_Id And PU.PortalUser_Id = @P_PortalUser_ID
END
GO
/****** Object:  StoredProcedure [dbo].[Get_SampleSp]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_SampleSp]

AS
BEGIN

	SET NOCOUNT ON;
	select 'Sample Sp here'
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ValidatePhoneNumber]    Script Date: 06-04-2022 12:07:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_ValidatePhoneNumber]
@PhoneNumber varchar(20)
AS
BEGIN
	
	SET NOCOUNT ON;

	if exists (select PortalUser_Phone from dbo.PortalUser where PortalUser_Phone=@PhoneNumber and IsActive=1)
	begin
	select 1
	end
	else
	select 0
END
GO
