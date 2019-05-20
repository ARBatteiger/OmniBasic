Attribute VB_Name = "Module1"
Public Const ConfigFile = 1
Public Const MachineConfigFile = 2
Public Const PartConfigFile = 3
Public Const CurrentProdFile = 4
Public Const MoldConfigFile = 5
Public Const CustomerFile = 6
Public Const ProductionFile = 7
Public Const UpdateMachShotFile = 8
Public Const UpdateMachModeFile = 9
Public Const UpdateMachAlarmFile = 10
Public Const UpdateMachSetupFile = 11
Public Const UpdateCurrentShotFile = 12
Public Const QueryMachShotFile = 13
Public Const QueryMachModeFile = 14
Public Const QueryMachAlarmFile = 15
Public Const QueryMachSetupFile = 16
Public Const QueryCurrentShotFile = 17
Public Const TempFile = 18
Public Const ProductionRptFile = 19
Public Const UpdateLogFile = 20
Public Const QueryLogFile = 21
Public Const QueueFile = 22
Public Const CommLogFile = 23
Public Const CurrentSetupFile = 24
Public Const ExportFile = 25
Public Const AlarmTypeFile = 26
Public Const MachineTypeFile = 27
Public Const RejectFile = 28
Public Const MacFile = 29

Public Type CurrentShotData ' Used to represent current shot (dynamic) data
    CurrentShotMode(16) As Byte
    CurrentShotTime(16) As Long
    CurrentShotData(16, 64) As Long
    CurrentShotTotal(16) As Long
    CurrentShotFirstNdx(16) As Long
    CurrentShotLastNdx(16) As Long
    CurrentShotFirstModeNdx(16) As Long
    CurrentShotLastModeNdx(16) As Long
    CurrentShotFirstAlarmNdx(16) As Long
    CurrentShotLastAlarmNdx(16) As Long
    CurrentShotFirstSetupNdx(16) As Long
    CurrentShotLastSetupNdx(16) As Long
    CurrentShotAutoRejected(16) As Long
    CurrentShotAccepted(16) As Long
    CurrentShotCavityAccepted(16, 16) As Long
    CurrentShotCavityRejects(16, 16) As Long
    CurrentShotAlarm(16) As Integer
End Type
Public CurrentShotSize As Long
Public UpdateCurrentShot As CurrentShotData
Public QueryCurrentShot As CurrentShotData
