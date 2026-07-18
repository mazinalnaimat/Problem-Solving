

-- This script generates an employee attendance report for a specified month and year.
-- It tracks the number of days present, absent, and on leave for a particular employee.

-- Declare variables
DECLARE @ReportMonth INT;
DECLARE @ReportYear INT;
DECLARE @TotalDays INT;
DECLARE @EmployeeID INT;
DECLARE @PresentDays INT;
DECLARE @AbsentDays INT;
DECLARE @LeaveDays INT;


SET @ReportMonth = 7; 
SET @ReportYear = 2023; 
SET @EmployeeID = 101; 

SET @TotalDays = DAY(EOMONTH(DATEFROMPARTS(@ReportYear, @ReportMonth, 1)));

SELECT @PresentDays = COUNT(*) FROM EmployeeAttendance
WHERE YEAR(EmployeeAttendance.AttendanceDate) = @ReportYear AND MONTH(EmployeeAttendance.AttendanceDate)= @ReportMonth AND EmployeeAttendance.EmployeeId = @EmployeeID  AND EmployeeAttendance.Status = 'Present';

SELECT @AbsentDays = COUNT(*) FROM EmployeeAttendance
WHERE YEAR(EmployeeAttendance.AttendanceDate) = @ReportYear AND MONTH(EmployeeAttendance.AttendanceDate)= @ReportMonth AND EmployeeAttendance.EmployeeId = @EmployeeID AND  EmployeeAttendance.Status = 'Absent';

SELECT @LeaveDays = COUNT(*) FROM EmployeeAttendance
WHERE YEAR(EmployeeAttendance.AttendanceDate) = @ReportYear AND MONTH(EmployeeAttendance.AttendanceDate)= @ReportMonth AND EmployeeAttendance.EmployeeId = @EmployeeID AND EmployeeAttendance.Status = 'Leave';



PRINT 'Employee Attendance Report for Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
PRINT 'Report Month: ' + CAST(@ReportMonth AS VARCHAR) + '/' + CAST(@ReportYear AS VARCHAR);
PRINT 'Total Working Days: ' + CAST(@TotalDays AS VARCHAR);
PRINT 'Days Present: ' + CAST(@PresentDays AS VARCHAR);
PRINT 'Days Absent: ' + CAST(@AbsentDays AS VARCHAR);
PRINT 'Days on Leave: ' + CAST(@LeaveDays AS VARCHAR);
