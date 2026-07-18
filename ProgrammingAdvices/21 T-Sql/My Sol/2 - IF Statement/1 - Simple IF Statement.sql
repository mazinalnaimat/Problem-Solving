

Declare @Num1 int, @Num2 int;
set @Num1 = 20;
set @Num2 =10;

-- you can use >, < , =, != 

PRINT 'Num1: ' + CAST(@Num1 AS NVARCHAR);
PRINT 'Num2: ' + CAST(@Num2 AS NVARCHAR);

IF @Num1 > @Num2
	BEGIN
		PRINT 'Yes Num1 is greater than Num2'
	END