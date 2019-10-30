print 'Starting at: ' + cast(GetUTCDate() as varchar)
go

set nocount on;
go

use master
go

drop database if exists HeavyIO
go

restore database HeavyIO from disk = 'heavyio.bak' with MAXTRANSFERSIZE=131072
go

use HeavyIO
go

dbcc dropcleanbuffers
go

select count(*) from tblBeast
go

print 'Completed at: ' + cast(GetUTCDate() as varchar)
go
root@42ceb32d4395:/startupscripts# clear
root@42ceb32d4395:/startupscripts# cat scan-db.sql
print 'Starting at: ' + cast(GetUTCDate() as varchar)
go

set nocount on;
go

use master
go

drop database if exists HeavyIO
go

restore database HeavyIO from disk = 'heavyio.bak' with MAXTRANSFERSIZE=131072
go

use HeavyIO
go

dbcc dropcleanbuffers
go

select count(*) from tblBeast
go

print 'Completed at: ' + cast(GetUTCDate() as varchar)
go